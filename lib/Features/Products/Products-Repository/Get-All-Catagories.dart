import 'dart:convert';

import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:http/http.dart' as https;

class GetAllCatagories
{
  Future<List> fetchCatagories() async {
    var Response_Catagories;
    try {
      final response =
      await https.get(Uri.parse('$baseUrl/products/categories'));

      if (response.statusCode == 200) {
        Response_Catagories = json.decode(response.body);
      } else {
        throw Exception(
            "Failed to load products. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching products: $e");
      throw Exception("An error occurred while fetching products: $e");
    }
    return Response_Catagories;
  }

}