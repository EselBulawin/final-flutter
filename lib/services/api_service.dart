import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/publisher.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Fetch publishers from the API
  Future<List<Publisher>> fetchPublishers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Publisher.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load publishers');
      }
    } catch (e) {
      throw Exception('Failed to load publishers: $e');
    }
  }
}
