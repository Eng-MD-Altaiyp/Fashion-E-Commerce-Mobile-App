import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';

class SingleProductRepository{
  Future<List> FetchSingleProduct(int ProductId) async {

    var existingData;
    try {
      existingData = await data_metter.readData("""
      SELECT * FROM products WHERE products_id = $ProductId
    """);
      return existingData;
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }
}