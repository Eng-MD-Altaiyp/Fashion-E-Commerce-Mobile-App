// get_wish_list_repository.dart

import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';

class GetWishListRepository {
  Future<List> fetchAllWishListFromLocaleStore() async {
    var existingData;
    try {
      existingData = await data_metter.readData("""
          SELECT * FROM products
          WHERE "products_favorite" = 1
      """);
      return existingData;
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }
}
