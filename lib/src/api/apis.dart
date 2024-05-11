import 'dart:convert';
import 'package:gugu/src/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Api {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';

  // Check for internet connection
  Future<bool> hasInternetConnection() async {
    try {
      final response = await http.head(Uri.parse(baseUrl));
      return response.statusCode == 200;
    } catch (e) {
      throw Exception("Check your internet connection");
    }
  }

  void _handleError(http.Response response) {
    if (response.statusCode != 200 &&
        response.statusCode != 400 &&
        response.statusCode != 300) {
      throw Exception("Failed to fetch data");
    }
  }

  Future<dynamic> get(BuildContext context, String endPoint) async {
    // if (!(await hasInternetConnection())) {
    //   throw Exception("No internet connection");
    // }
    try {
      final response = await http
          .get(Uri.parse("$baseUrl$endPoint"))
          .timeout(Duration(seconds: 5));
      _handleError(response);
      return response;
    } catch (e) {
      AppSnackbar(
        isError: true,
        response: e.toString(),
      ).show(context);
      throw Exception("Failed to fetch data");
    }
  }

  // POST Request
  Future<dynamic> post(
      BuildContext context, String endPoint, Map<String, dynamic> data) async {
    // if (!(await hasInternetConnection())) {
    //   throw Exception("No internet connection");
    // } else {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl$endPoint'),
            body: data,
          )
          .timeout(Duration(seconds: 10));
      _handleError(response);
      return response;
    } catch (e) {
      AppSnackbar(
        isError: true,
        response: e.toString(),
      ).show(context);
    }
    // }
  }

  // PUT Request
  Future<dynamic> put(String endPoint, Map<String, dynamic> data) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      final response = await http
          .put(Uri.parse("$baseUrl/$endPoint"), body: data)
          .timeout(Duration(seconds: 5));
      _handleError(response);
      return json.decode(response.body);
    } catch (e) {
      throw Exception("Failed to update data");
    }
  }

  // DELETE Request
  Future<dynamic> delete(String endPoint) async {
    if (!(await hasInternetConnection())) {
      throw Exception("No internet connection");
    }
    try {
      final response = await http
          .delete(Uri.parse("$baseUrl/$endPoint"))
          .timeout(Duration(seconds: 5));
      _handleError(response);
      return json.decode(response.body);
    } catch (e) {
      throw Exception("Failed to delete data");
    }
  }
}
