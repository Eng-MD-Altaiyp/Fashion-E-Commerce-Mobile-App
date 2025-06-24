import 'dart:convert';
import 'dart:io';

import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Fetch-Products-Data.dart';
import 'package:http/http.dart' as https;
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';

class API_LOGIN{
  Future<String> loginUser(String username, String password) async {
    final Uri url = Uri.parse('$baseUrl/auth/login');

    LocaleStore Data = LocaleStore();

    try {
      Data.fetchProducts();
      final response = await https.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // 'username': username,
          // 'password': password,
          "username": "mor_2314",
          "password": "83r5^_"
        }),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['token'].toString();
      } else if (response.statusCode == 401) {
        throw Exception("Invalid username or password");
      } else {
        throw Exception("Failed to login. Status Code: ${response.statusCode}");
      }
    } on SocketException {
      throw Exception("No Internet connection. Please check your network.");
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }

}