import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiServices {
  // Get Auth key
  static String getBasicAuthKey(String username, String password) {
    String credential = '$username:$password';
    String encoded = base64.encode(utf8.encode(credential));

    return encoded;
  }

  // GET ONE
  static Future<Map<String, dynamic>> consumeGetOne(String apiUrl) async {
    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get one.');
    }
  }

  // GET ALL
  static Future<Map<String, dynamic>> consumeGetAll(String apiUrl) async {
    final http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get all.');
    }
  }

  // CREATE (used for login & register)
  static Future<Map<String, dynamic>> consumeCreate(
      String apiUrl, Map body) async {
    final http.Response response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: json.encode(body));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create.');
    }
  }

  // UPDATE WITH CRE
  static Future<Map<String, dynamic>> consumeUpdateWithCre(
      String apiUrl, Map body, String username, String password) async {
    String encoded = ApiServices.getBasicAuthKey(username, password);

    final http.Response response = await http.put(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Basic $encoded'
        },
        body: json.encode(body));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create.');
    }
  }

  // DELETE WITH CRE
  static Future<void> consumeDelete(
      String apiUrl, String username, String password) async {
    String encoded = ApiServices.getBasicAuthKey(username, password);

    final http.Response response = await http.delete(Uri.parse(apiUrl),
        headers: <String, String>{'Authorization': 'Basic $encoded'});
    if (response.statusCode == 200) {
      print("Deleted");
    } else {
      throw "Failed to delete.";
    }
  }

  // Get one with Cre
  static Future<Map<String, dynamic>> consumeGetOneWithCre(
      String apiUrl, String username, String password) async {
    String encoded = ApiServices.getBasicAuthKey(username, password);

    final http.Response response = await http.get(Uri.parse(apiUrl),
        headers: <String, String>{'Authorization': 'Basic $encoded'});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to get current user with credentials.');
    }
  }

  // Create with Credentials required
  static Future<Map<String, dynamic>> consumeCreateWithCre(
      String apiUrl, Map body, String username, String password) async {
    String encoded = ApiServices.getBasicAuthKey(username, password);

    final http.Response response = await http.post(Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Basic $encoded'
        },
        body: json.encode(body));

    if (response.statusCode == 201 || response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to create with credentials.');
    }
  }

  // Used for create a post
  // static Future<Map<String, dynamic>> consumeCreateWithImage(String apiUrl,
  //     String text, File image, String username, String password) async {
  //   String encoded = ApiServices.getBasicAuthKey(username, password);
  //
  //   final request = http.MultipartRequest('POST', Uri.parse(apiUrl));
  //   final file = await http.MultipartFile.fromPath('photo', image.path);
  //
  //   request.fields['text'] = text;
  //   request.files.add(file);
  //
  //   request.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //     'Authorization': 'Basic $encoded'
  //   });
  //
  //   final streamResponse = await request.send();
  //   final response = await http.Response.fromStream(streamResponse);
  //
  //   print(response.statusCode);
  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw 'Failed to create with image file.';
  //   }
  // }

  // Update profile image
  // static Future<Map<String, dynamic>> consumeUpdateWithImage(String apiUrl, File image, String username, String password) async {
  //   String encoded = ApiServices.getBasicAuthKey(username, password);
  //
  //   final request = http.MultipartRequest('PATCH', Uri.parse(apiUrl));
  //   final file = await http.MultipartFile.fromPath('profile_pic', image.path);
  //
  //   request.files.add(file);
  //
  //   request.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //     'Authorization': 'Basic $encoded'
  //   });
  //
  //   final streamResponse = await request.send();
  //   final response = await http.Response.fromStream(streamResponse);
  //   if (response.statusCode == 200) {
  //     return json.decode(response.body);
  //   } else {
  //     throw 'Failed to update image file.';
  //   }
  // }

}
