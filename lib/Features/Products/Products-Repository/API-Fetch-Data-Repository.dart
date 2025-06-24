import 'dart:convert';
import 'package:http/http.dart' as https;


class APIFetchDataRepository
{
  Future<List> fetchProductsFromApi(String URI_Api) async {
    final response = await https.get(Uri.parse('$URI_Api'));
    final data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
    return data;
  }


  Future<List> GetDataDummyJson(String URI_Api) async {
    try {
      final response = await https.get(Uri.parse("$URI_Api"));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        return data['products'];
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }
}