from flask import Flask, request, jsonify
from flask_cors import CORS
import ollama
import json
import random

app = Flask(__name__)
CORS(app)

def generate_question_with_mistral(topic: str, difficulty: str) -> dict:
    prompt = f"""Generate a multiple-choice question about {topic} with difficulty level {difficulty}.
    The response should be in JSON format with the following structure:
    {{
        "question": "The question text",
        "options": ["Option A", "Option B", "Option C", "Option D"],
        "correctAnswer": "The correct option",
        "explanation": "A detailed explanation of why this is the correct answer",
        "difficulty": "{difficulty}",
        "topic": "{topic}"
    }}

    Make sure the question is challenging but appropriate for the {difficulty} difficulty level.
    The explanation should be educational and help the user understand the concept better.
    """

    try:
        response = ollama.chat(
            model='mistral',
            messages=[
                {
                    'role': 'user',
                    'content': prompt
                }
            ]
        )

        # Extract the JSON response from the model's output
        response_text = response['message']['content']
        
        # Find the JSON object in the response
        start_idx = response_text.find('{')
        end_idx = response_text.rfind('}') + 1
        
        if start_idx == -1 or end_idx == 0:
            raise ValueError("No JSON object found in the response")
        
        json_str = response_text[start_idx:end_idx]
        question_data = json.loads(json_str)

        # Validate the response structure
        required_fields = ['question', 'options', 'correctAnswer', 'explanation', 'difficulty', 'topic']
        for field in required_fields:
            if field not in question_data:
                raise ValueError(f"Missing required field: {field}")

        # Ensure there are exactly 4 options
        if len(question_data['options']) != 4:
            raise ValueError("Question must have exactly 4 options")

        # Ensure the correct answer is one of the options
        if question_data['correctAnswer'] not in question_data['options']:
            raise ValueError("Correct answer must be one of the options")

        return question_data

    except Exception as e:
        # Fallback response in case of any errors
        return {
            "question": f"Sample question about {topic}",
            "options": [
                "Option A",
                "Option B",
                "Option C",
                "Option D"
            ],
            "correctAnswer": "Option A",
            "explanation": "This is a fallback question. Please try again.",
            "difficulty": difficulty,
            "topic": topic
        }

@app.route('/api/questions', methods=['GET'])
def get_question():
    try:
        topic = request.args.get('topic', 'General Knowledge')
        difficulty = request.args.get('difficulty', 'Easy')

        question = generate_question_with_mistral(topic, difficulty)
        return jsonify(question)

    except Exception as e:
        return jsonify({
            "error": str(e)
        }), 500

@app.route('/generate_question', methods=['POST'])
def generate_question():
    try:
        data = request.get_json()
        topic = data.get('topic', 'General Knowledge')
        difficulty = data.get('difficulty', 'Easy')

        question = generate_question_with_mistral(topic, difficulty)
        return jsonify(question)

    except Exception as e:
        return jsonify({
            "error": str(e)
        }), 500

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True) 