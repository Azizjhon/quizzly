# AI Adaptive Quiz

A Flutter application that generates adaptive quiz questions using AI. The app adjusts question difficulty based on user performance and provides detailed explanations for answers.

## Features

- Multiple quiz topics to choose from
- Adaptive difficulty based on user performance
- Beautiful and modern UI with Material Design 3
- Detailed explanations for each answer
- Score tracking and performance analysis
- Responsive design that works on all screen sizes

## Prerequisites

1. Flutter SDK (latest version)
2. Dart SDK (latest version)
3. Android Studio / VS Code with Flutter extensions
4. Backend server running (see backend README)

## Setup

1. Install dependencies:
   ```bash
   flutter pub get
   ```

2. Make sure the backend server is running on `http://127.0.0.1:5000`

## Running the App

1. Connect a device or start an emulator
2. Run the app:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
  ├── main.dart              # App entry point and theme configuration
  ├── models/
  │   └── question_model.dart # Question data model
  ├── screens/
  │   ├── home_screen.dart   # Topic and difficulty selection
  │   ├── quiz_screen.dart   # Quiz interface
  │   └── result_screen.dart # Results and explanations
  ├── services/
  │   └── api_service.dart   # Backend API communication
  └── widgets/
      └── answer_option.dart # Answer option UI component
```

## Dependencies

- `http`: For API communication
- `google_fonts`: For custom typography
- `provider`: For state management
- `shared_preferences`: For local storage

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
