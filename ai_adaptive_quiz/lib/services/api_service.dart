import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class ApiService {
  static const String _baseUrl = 'http://127.0.0.1:5000';

  Future<Question> generateQuestion({
    required String topic,
    required String difficulty,
  }) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$_baseUrl/api/questions?topic=$topic&difficulty=$difficulty'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return Question.fromJson(data);
      } else {
        throw Exception('Failed to generate question: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}
