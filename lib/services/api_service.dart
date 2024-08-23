import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl = 'http://localhost:3000/api'; // URL del backend Node.js

  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar datos');
    }
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al enviar datos');
    }
  }
}


