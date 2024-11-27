import 'package:dio/dio.dart';

class PostService {
  final Dio _dio = Dio();

  // URL base de la API
  final String _baseUrl = 'https://6740e5dad0b59228b7f1b5d7.mockapi.io/posts/posts';

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        // Retorna la lista de posts
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception('Error al obtener los posts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al conectar con la API: $e');
    }
  }
}
