class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;
  final String explanation;
  final String difficulty;
  final String topic;
  String? selectedAnswer;
  bool? isCorrect;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.explanation,
    required this.difficulty,
    required this.topic,
    this.selectedAnswer,
    this.isCorrect,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      question: json['question'] as String,
      options: List<String>.from(json['options'] as List),
      correctAnswer: json['correctAnswer'] as String,
      explanation: json['explanation'] as String,
      difficulty: json['difficulty'] as String,
      topic: json['topic'] as String,
    );
  }

  Question copyWith({
    String? question,
    List<String>? options,
    String? correctAnswer,
    String? explanation,
    String? difficulty,
    String? topic,
    String? selectedAnswer,
    bool? isCorrect,
  }) {
    return Question(
      question: question ?? this.question,
      options: options ?? this.options,
      correctAnswer: correctAnswer ?? this.correctAnswer,
      explanation: explanation ?? this.explanation,
      difficulty: difficulty ?? this.difficulty,
      topic: topic ?? this.topic,
      selectedAnswer: selectedAnswer ?? this.selectedAnswer,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'options': options,
      'correctAnswer': correctAnswer,
      'explanation': explanation,
      'difficulty': difficulty,
      'topic': topic,
      'selectedAnswer': selectedAnswer,
      'isCorrect': isCorrect,
    };
  }
}
