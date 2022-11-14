import 'package:dio/dio.dart';
import 'package:flutter_api_example/models/comment.dart';
import 'package:flutter_api_example/models/post.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  ApiService();

  Future<List<Post>> getPosts() async {
    try {
      final Response response = await _dio.get('/posts');
      return (response.data as List).map((element) => Post.fromJson(element)).toList();
    } catch (e) {
      print("Error encountered: $e");
    }
    return [];
  }

  Future<List<Comment>> getPostComments({required int postId}) async {
    try {
      final Response response = await _dio.get(
        '/comments',
        queryParameters: {'postId': postId},
      );
      return (response.data as List).map((element) => Comment.fromJson(element)).toList();
    } catch (e) {
      print("Error encountered: $e");
    }
    return [];
  }
}
