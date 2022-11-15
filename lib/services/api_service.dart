import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter_api_example/models/comment.dart';
import 'package:flutter_api_example/models/post.dart';

class ApiService {
  // Setup the Dio object with the baseUrl
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  // Default Constructor. Since we have no parameters needed to create an ApiService object, the constructor is empty
  ApiService();

  // An asynchronous function that returns a List of Post objects or throws an exception
  Future<List<Post>> getPosts() async {
    // Try to run this block of code. If any exceptions are thrown, they are caught in the catch block
    try {
      // Wait for dio to get recieve a response from the server
      final Response response = await _dio.get('/posts');
      // Check if the response status code is OK
      if (response.statusCode == HttpStatus.ok) {
        // Convert the response data to a List of JSON objects then convert each JSON object to a Post object and
        // return the List of Post objects
        return (response.data as List).map((element) => Post.fromJson(element)).toList();
      }
      // If response status code is not OK, throw an exception
      else {
        throw Exception('GET call returned with status code: ${response.statusCode}');
      }
    }
    // Catch any exception as the variable e
    catch (e) {
      print("Error encountered: $e");
      // Return an empty list if an exception is caught
      return [];
    }
  }

  // An asynchronous function that returns a List of Comment objects or throws an exception
  Future<List<Comment>> getPostComments({required int postId}) async {
    // Try to run this block of code. If any exceptions are thrown, they are caught in the catch block
    try {
      // Convert the response data to a List of JSON objects then convert each JSON object to a Comment object and
      // return the List of Comment objects
      final Response response = await _dio.get(
        '/comments',
        // Pass in the id of the post you want the comments of
        queryParameters: {'postId': postId},
      );
      // Check if the response status code is OK
      if (response.statusCode == HttpStatus.ok) {
        return (response.data as List).map((element) => Comment.fromJson(element)).toList();
      }
      // If response status code is not OK, throw an exception
      else {
        throw Exception('GET call returned with status code: ${response.statusCode}');
      }
    }
    // Catch any exception as the variable e
    catch (e) {
      print("Error encountered: $e");
      // Return an empty list if an exception is caught
      return [];
    }
  }
}
