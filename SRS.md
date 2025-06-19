# Software Requirements Specification (SRS)

## 1. Introduction

### 1.1 Purpose
The purpose of this document is to specify the requirements for the AI Adaptive Quiz application, which provides users with dynamically generated quiz questions tailored to their selected topic and difficulty. The system aims to deliver an engaging, adaptive learning experience.

### 1.2 Scope
The AI Adaptive Quiz consists of:
- A **Flutter-based frontend** for user interaction, quiz-taking, and result review.
- A **Flask-based backend** that uses the Ollama API and the Mistral model to generate quiz questions and explanations in real time.

### 1.3 Technology Stack
- **Frontend:** Flutter, Dart, Google Fonts, HTTP package
- **Backend:** Python 3.8+, Flask, Flask-CORS, Ollama (Mistral model), JSON
- **Other:** Ollama server (local), RESTful API

---

## 2. Functional Requirements

| Feature | Description | Priority |
|---------|-------------|----------|
| Topic Selection | User can select a quiz topic from a predefined list | High |
| Difficulty Selection | User can select quiz difficulty (Easy/Medium/Hard) | High |
| Start Quiz | User can start a quiz based on selected topic and difficulty | High |
| Adaptive Question Generation | System generates questions using AI, adapting difficulty based on user performance | High |
| Answer Submission | User can select and submit answers to questions | High |
| Immediate Feedback | User receives instant feedback (correct/incorrect, explanation) after each answer | High |
| Score Tracking | System tracks number of correct answers and total questions | High |
| Result Summary | User receives a summary of their performance at the end of the quiz | High |
| Question Review | User can review each question, their answer, the correct answer, and explanation | Medium |
| Error Handling | User is notified of errors (e.g., network, backend issues) | High |
| Responsive UI | Application is visually responsive and user-friendly | Medium |
| API Security | Only valid requests are processed by the backend | Medium |
| Usage Analytics | System collects basic usage analytics (e.g., number of quizzes taken, average score) | Medium |

---

## 3. Non-Functional Requirements

### 3.1 Performance
- The system should generate and deliver each question within 5 seconds under normal conditions.
- The UI should remain responsive during API calls (loading indicators).

### 3.2 Security
- The backend should validate all incoming requests.
- CORS is enabled to allow frontend-backend communication.
- No sensitive user data is stored or transmitted.

### 3.3 Scalability
- The backend should support multiple concurrent users (limited by Ollama/model performance).
- The system is intended for local use only and is not required to scale to cloud/production environments.

### 3.4 Analytics
- The system should log basic usage analytics, such as the number of quizzes started/completed and average scores.
- Analytics data should be stored locally and not transmitted externally.

---

## 4. Use Cases

### 4.1 Start a Quiz

- **Actor:** User
- **Preconditions:** User is on the Home screen; Ollama backend is running.
- **Steps:**
  1. User selects a topic and difficulty.
  2. User clicks "Start Quiz".
  3. System navigates to the Quiz screen and fetches the first question.

### 4.2 Answer a Question

- **Actor:** User
- **Preconditions:** User is on the Quiz screen with a question loaded.
- **Steps:**
  1. User selects an answer option.
  2. System checks the answer, updates score/streak, and displays feedback and explanation.
  3. After a short delay, the next question is loaded (or results are shown if quiz is complete).

### 4.3 View Quiz Results

- **Actor:** User
- **Preconditions:** User has completed all quiz questions.
- **Steps:**
  1. System displays the user's score, percentage, and a review of all questions.
  2. User can see which questions were answered correctly/incorrectly, the correct answers, and explanations.

---

## 5. Assumptions and Constraints

- No user authentication or persistent user history is required; the app is strictly anonymous and single-session.
- Each quiz consists of a fixed number of questions (10).
- Quiz topics are fixed and cannot be modified or added by users.
- The system is intended for local use only and is not required to be deployable to cloud/production environments.
- No specific accessibility requirements are mandated.
- The backend relies on the quality and consistency of the Mistral model's output.
- Usage analytics are required and should be stored locally. 