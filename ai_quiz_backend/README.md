# AI Adaptive Quiz Backend

This is the backend server for the AI Adaptive Quiz application. It uses Flask and Ollama with the Mistral model to generate adaptive quiz questions.

## Prerequisites

1. Python 3.8 or higher
2. Ollama installed and running (download from https://ollama.com)
3. Mistral model pulled (`ollama pull mistral`)

## Setup

1. Create and activate a virtual environment:
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate

   # macOS/Linux
   python -m venv venv
   source venv/bin/activate
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Running the Server

1. Make sure Ollama is running in the background
2. Start the Flask server:
   ```bash
   python app.py
   ```

The server will run on `http://127.0.0.1:5000`

## API Endpoints

### POST /generate_question

Generates a quiz question based on the topic and difficulty level.

Request body:
```json
{
    "topic": "Science",
    "difficulty": "Easy"
}
```

Response:
```json
{
    "question": "What is the chemical symbol for gold?",
    "options": ["Au", "Ag", "Fe", "Cu"],
    "correctAnswer": "Au",
    "explanation": "Gold's chemical symbol is Au, derived from the Latin word 'aurum'.",
    "difficulty": "Easy",
    "topic": "Science"
}
``` 