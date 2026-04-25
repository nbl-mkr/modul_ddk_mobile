import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todo/models/ToDo.dart';

class HttpService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List> getPopularMovies() async {
    http.Response result = await http.get(
      Uri.parse(baseUrl),
      headers: {'Accept': 'application/json', 'User-Agent': 'Mozilla/5.0'},
    );
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      List todos = jsonResponse.map((i) => Todo.fromJson(i)).toList();
      return todos;
    } else {
      return [];
    }
  }
}
