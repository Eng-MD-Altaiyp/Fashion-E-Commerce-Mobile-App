import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';


class FetchAllProducts
{
  Future<List> fetchAllProductsFromLocaleStore() async {
    var existingData;
    try {
      existingData = await data_metter.readData("""
      $Select_Store
    """);

      // print('sssssssssssssssssssssss $existingData');
      return existingData;
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }
}