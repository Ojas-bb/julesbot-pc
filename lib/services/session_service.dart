import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/session.dart';

class SessionService {
  static const String _baseUrl = 'http://localhost:8080/sessions';

  Future<List<Session>> fetchSessions() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Session.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load sessions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching sessions: $e');
    }
  }
}
