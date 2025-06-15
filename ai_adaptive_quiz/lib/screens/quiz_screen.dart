import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/question_model.dart';
import '../services/api_service.dart';
import '../widgets/answer_option.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final String topic;
  final String initialDifficulty;

  const QuizScreen({
    super.key,
    required this.topic,
    required this.initialDifficulty,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final ApiService _apiService = ApiService();
  late Future<Question> _currentQuestionFuture;
  Question? _currentQuestion;
  int _correctAnswers = 0;
  int _totalQuestions = 0;
  int _currentStreak = 0;
  String _currentDifficulty = '';
  bool _isLoading = true;
  bool _hasAnswered = false;
  List<Question> _answeredQuestions = [];

  @override
  void initState() {
    super.initState();
    _currentDifficulty = widget.initialDifficulty;
    _loadQuestion();
  }

  Future<void> _loadQuestion() async {
    setState(() {
      _isLoading = true;
      _hasAnswered = false;
    });

    try {
      _currentQuestionFuture = _apiService.generateQuestion(
        topic: widget.topic,
        difficulty: _currentDifficulty,
      );
      final question = await _currentQuestionFuture;
      setState(() {
        _currentQuestion = question;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error loading question: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _handleAnswer(String selectedAnswer) {
    if (_hasAnswered || _currentQuestion == null) return;

    setState(() {
      _hasAnswered = true;
      _totalQuestions++;
      final isCorrect = selectedAnswer == _currentQuestion!.correctAnswer;
      _currentQuestion = _currentQuestion!.copyWith(
        selectedAnswer: selectedAnswer,
        isCorrect: isCorrect,
      );

      if (isCorrect) {
        _correctAnswers++;
        _currentStreak++;
      } else {
        _currentStreak = 0;
      }

      _answeredQuestions.add(_currentQuestion!);

      // Adjust difficulty based on streak
      if (_currentStreak >= 3 && _currentDifficulty != 'Hard') {
        _currentDifficulty = 'Hard';
      } else if (_currentStreak == 0 && _currentDifficulty != 'Easy') {
        _currentDifficulty = 'Easy';
      }
    });

    // Wait for 1.5 seconds before loading the next question
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        if (_totalQuestions >= 10) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                questions: _answeredQuestions,
                correctAnswers: _correctAnswers,
                totalQuestions: _totalQuestions,
              ),
            ),
          );
        } else {
          _loadQuestion();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question ${_totalQuestions + 1}/10',
          style: GoogleFonts.inter(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _currentQuestion == null
          ? const Center(child: Text('Error loading question'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _currentQuestion!.question,
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Difficulty: ${_currentQuestion!.difficulty}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ..._currentQuestion!.options.map(
                    (option) => AnswerOption(
                      option: option,
                      isSelected: _currentQuestion!.selectedAnswer == option,
                      isCorrect: _hasAnswered
                          ? option == _currentQuestion!.correctAnswer
                          : null,
                      onTap: () => _handleAnswer(option),
                    ),
                  ),
                  if (_hasAnswered) ...[
                    const SizedBox(height: 24),
                    Card(
                      color: _currentQuestion!.isCorrect!
                          ? Colors.green.shade50
                          : Colors.red.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _currentQuestion!.isCorrect!
                                  ? 'Correct!'
                                  : 'Incorrect!',
                              style: TextStyle(
                                color: _currentQuestion!.isCorrect!
                                    ? Colors.green.shade800
                                    : Colors.red.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _currentQuestion!.explanation,
                              style: TextStyle(color: Colors.grey.shade800),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
    );
  }
}
