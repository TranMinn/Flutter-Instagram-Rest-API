import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

class ApiServices {

  // GET ONE
  static Future<Map<String, dynamic>> consumeGetOne(String apiUrl) async {
    final Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get one.');
    }
  }

  // GET ALL
  static Future<List<dynamic>> consumeGetAll(String apiUrl) async {
    final Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get all.');
    }
  }

  // CREATE
  static Future<Map<String, dynamic>> consumeCreate(
      String apiUrl, Map body) async {
    final Response response = await post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(body));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create.');
    }
  }

  // UPDATE
  static Future<Map<String, dynamic>> consumeUpdate(
      String apiUrl, Map body) async {
    final Response response = await put(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(body));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create.');
    }
  }

  // DELETE
  static Future<void> consumeDelete(String apiUrl) async {
    final Response response = await delete(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Failed to delete.";
    }
  }
}
