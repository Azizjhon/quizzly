# Quizlly - AI Adaptive Quiz Platform

Quizlly is an intelligent quiz application that generates personalized, adaptive questions using AI. The system adjusts question difficulty based on user performance, providing an engaging and effective learning experience.

## Features

- **Topic Selection**: Choose from various predefined topics
- **Adaptive Difficulty**: Questions adapt to your performance level
- **AI-Powered**: Uses Ollama/Mistral model for question generation
- **Instant Feedback**: Get immediate feedback and explanations
- **Progress Tracking**: Review your performance and learning journey
- **Local Analytics**: Track usage statistics locally

## Technology Stack

### Frontend
- Flutter/Dart
- Google Fonts
- HTTP package for API communication

### Backend
- Python 3.8+
- Flask
- Flask-CORS
- Ollama (Mistral model)

## Prerequisites

1. Python 3.8 or higher
2. Flutter SDK
3. Ollama installed and running (download from https://ollama.com)
4. Mistral model pulled (`ollama pull mistral`)

## Setup Instructions

### Backend Setup

1. Navigate to the backend directory:
   ```bash
   cd ai_quiz_backend
   ```

2. Create and activate a virtual environment:
   ```bash
   # Windows
   python -m venv venv
   .\venv\Scripts\activate

   # macOS/Linux
   python -m venv venv
   source venv/bin/activate
   ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

4. Start the Flask server:
   ```bash
   python app.py
   ```
   The server will run on `http://127.0.0.1:5000`

### Frontend Setup

1. Navigate to the frontend directory:
   ```bash
   cd ai_adaptive_quiz
   ```

2. Get Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
quizzly/
├── ai_adaptive_quiz/          # Flutter frontend
│   ├── lib/
│   │   ├── models/           # Data models
│   │   ├── screens/          # UI screens
│   │   ├── services/         # API services
│   │   └── widgets/          # Reusable widgets
│   └── test/                 # Frontend tests
├── ai_quiz_backend/          # Flask backend
│   ├── app.py               # Main Flask application
│   └── requirements.txt     # Python dependencies
├── design/                  # UML and DFD diagrams
├── SRS.md                  # Software Requirements Specification
└── README.md              # This file
```

## Documentation

- [Software Requirements Specification (SRS)](./SRS.md)
- [Use Case Diagram](./design/use_case_diagram.mmd)
- [Class Diagram](./design/class_diagram.mmd)
- [Data Flow Diagram](./design/dfd.mmd)
- [System Architecture](./design/architecture.mmd)

## API Endpoints

### POST /generate_question
Generates a quiz question based on topic and difficulty.

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

## Testing

Run frontend tests:
```bash
cd ai_adaptive_quiz
flutter test
```

## Future Enhancements

- User authentication
- Custom topics
- Enhanced analytics
- Cloud deployment options
- Accessibility improvements

## Contributing

This is a solo academic project, but suggestions and feedback are welcome!

## License

This project is created for academic purposes. All rights reserved. 