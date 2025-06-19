# Software Requirements Specification (SRS)
**Project:** Quizlly – AI Adaptive Quiz Platform

---

## 1. Introduction

### 1.1 Purpose
This Software Requirements Specification (SRS) describes the requirements for Quizlly, an AI-powered adaptive quiz platform. The document is intended for developers, testers, project managers, and stakeholders to ensure a clear understanding of the system's objectives, features, and constraints.

### 1.2 Scope
Quizlly is a local, single-user educational tool that generates adaptive quizzes using AI. Users select a topic and difficulty, answer questions, receive instant feedback, and review results. The system consists of a Flutter frontend and a Flask backend, leveraging the Ollama/Mistral AI model for question generation.

### 1.3 Definitions, Acronyms, and Abbreviations
- **AI:** Artificial Intelligence
- **SRS:** Software Requirements Specification
- **DFD:** Data Flow Diagram
- **UML:** Unified Modeling Language
- **API:** Application Programming Interface
- **Ollama/Mistral:** AI model and server for question generation

### 1.4 References
- [Quizlly GitHub Repository](https://github.com/Azizjhon/quizzly)
- [Flutter Documentation](https://flutter.dev/docs)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [Ollama](https://ollama.com)

### 1.5 Overview
This document details the system's requirements, design, interfaces, testing strategy, and references all supporting diagrams and documentation.

---

## 2. Overall Description

### 2.1 Product Perspective
- Standalone educational tool for local use
- Modular architecture: Flutter frontend, Flask backend, AI model
- No user authentication; single-session, anonymous use

### 2.2 Product Functions
- Topic and difficulty selection
- Adaptive quiz generation (AI-powered)
- Answer submission and instant feedback
- Result summary and review
- Local analytics (usage tracking)

### 2.3 User Classes and Characteristics
- **Learner:** Any individual seeking to practice and improve knowledge in various topics
- **Educator (optional):** May use the tool to demonstrate adaptive learning

### 2.4 Operating Environment
- Windows, macOS, or Linux (local machine)
- Python 3.8+, Node.js (for diagram export), Flutter SDK
- Ollama server and Mistral model running locally

### 2.5 Design and Implementation Constraints
- Local-only deployment (no cloud hosting)
- Fixed topics and 10-question quizzes
- No persistent user accounts or history
- Analytics stored locally

### 2.6 User Documentation
- `README.md` (setup, usage, troubleshooting)
- `SRS.md` (requirements)
- Diagrams in `design/` folder

### 2.7 Assumptions and Dependencies
- Ollama and Mistral model are installed and running
- User has required Python and Flutter environments
- No accessibility requirements

---

## 3. Specific Requirements

### 3.1 Functional Requirements

#### 3.1.1 User Interface
- **FR1:** The system shall allow the user to select a topic from a predefined list.
- **FR2:** The system shall allow the user to select a difficulty level (Easy/Medium/Hard).
- **FR3:** The system shall allow the user to start a quiz.
- **FR4:** The system shall display one question at a time with four answer options.
- **FR5:** The system shall allow the user to select and submit an answer.
- **FR6:** The system shall provide instant feedback (correct/incorrect, explanation) after each answer.
- **FR7:** The system shall display a summary of results at the end of the quiz.
- **FR8:** The system shall allow the user to review all questions, their answers, correct answers, and explanations.

#### 3.1.2 Backend/API
- **FR9:** The backend shall generate questions using the Ollama/Mistral AI model based on the selected topic and difficulty.
- **FR10:** The backend shall adapt question difficulty based on user performance (streaks).
- **FR11:** The backend shall log basic usage analytics locally (e.g., number of quizzes taken, average score).
- **FR12:** The backend shall handle errors gracefully and provide fallback questions if AI generation fails.

#### 3.1.3 Data Management
- **FR13:** The system shall store analytics data locally.
- **FR14:** The system shall not store any personal or sensitive user data.

### 3.2 Non-Functional Requirements

- **Performance:** Each question should be generated and delivered within 5 seconds.
- **Security:** No sensitive data stored or transmitted; CORS enabled for frontend-backend communication.
- **Scalability:** Supports multiple local users (one at a time); not intended for cloud or multi-user deployment.
- **Reliability:** Graceful error handling and fallback questions.
- **Usability:** Simple, intuitive UI; clear feedback and navigation.
- **Maintainability:** Modular code, clear documentation, easy to extend.

### 3.3 External Interface Requirements

#### 3.3.1 User Interface
- Home screen: topic/difficulty selection, start quiz button
- Quiz screen: question display, answer options, feedback
- Result screen: score, review, explanations

#### 3.3.2 API Interface
- `/generate_question` (POST): Generates a question based on topic and difficulty
- `/api/questions` (GET): Fetches a question (alternative endpoint)

#### 3.3.3 Hardware Interface
- Standard PC or laptop

#### 3.3.4 Software Interface
- Requires Python, Flask, Flutter, Ollama, Mistral model

### 3.4 System Features
- Adaptive question difficulty
- Instant feedback and explanations
- Result summary and review
- Local analytics
- Error handling and fallback

---

## 4. Modeling & Design

- **Use Case Diagram:** `design/use_case_diagram.mmd`
- **Class Diagram (UML):** `design/class_diagram.mmd`
- **Data Flow Diagram (DFD):** `design/dfd.mmd`
- **System Architecture Diagram:** `design/architecture.mmd`
- *(Add sequence diagrams if required by your instructor)*

---

## 5. Testing Strategy

- **Unit Testing:**
  - Backend: Test API endpoints, error handling, fallback logic
  - Frontend: Test UI widgets, navigation, API integration
- **Integration Testing:**
  - End-to-end flow: start quiz, answer questions, view results
- **Manual Testing:**
  - Run through all user flows and error scenarios
- **Evidence:**
  - Test scripts, screenshots, or logs (to be included in `test/` or README)

---

## 6. Maintenance & Future Enhancements

- **Codebase:** Modular, well-commented, easy to extend (add topics, question types)
- **Dependencies:** Documented in README; update instructions provided
- **Analytics:** Local storage, with option to reset/export
- **Error Handling:** Logs errors, user-friendly messages
- **Future Enhancements:**
  - Add user authentication (optional)
  - Support for custom topics
  - Cloud deployment
  - Enhanced analytics and reporting
  - Accessibility improvements

---

## 7. Appendices

- **A. Glossary:** See Section 1.3
- **B. References:** See Section 1.4
- **C. Diagrams:** See Section 4 