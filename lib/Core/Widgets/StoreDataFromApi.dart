import 'package:http/http.dart' as https;
import 'dart:convert';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';

class LocaleStore{
  Future<List> fetchProducts() async {
    final response = await https.get(Uri.parse(URI_API));
    final data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      int length = data.length;
      favo_a = List.generate(length, (index) => false);

      storeProducts(data);
    } else {
      throw Exception("Failed to load products");
    }
    return data;
  }

  Future<void> storeProducts(List<dynamic> data) async {
    try {
      var existingData = await data_metter.readData("""
      SELECT * FROM products
    """);
      if (existingData.isEmpty) {
        Set<String> existingProductNames =
        existingData.map((e) => e['products_name'].toString()).toSet();
        for (var product in data) {
          if (!existingProductNames.contains(product['title'])) {
            String Cata = "";
            if (product['category'] == "women's clothing") {
              Cata = "women";
            } else if (product['category'] == "men's clothing") {
              Cata = "men";
            } else {
              Cata = product['category'];
            }
            int insertD = await data_metter.insertData("""
          INSERT INTO products (products_name, products_price, products_favorite, products_category, products_description, products_image, products_cart, products_counter)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        """, [
              product['title'],
              product['price'],
              0,
              Cata,
              product['description'],
              product['image'],
              0,
              0
            ]);
            print("Product Inserted Successfully: ID $insertD");
          } else {
            print("Product Already Exists: ${product['title']}");
          }
        }
        print("All Products Stored Successfully!");
      } else if (existingData.isNotEmpty) {
        print(
            "ISSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS FUUUUUUUUUUUUUUUUUUUUULL");
      }
    } catch (e) {
      print("Error occurred while storing products: $e");
    }
  }
}