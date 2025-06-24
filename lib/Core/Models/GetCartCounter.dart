


import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';

class CartCounter
{
  Future<int> Carts_Counter() async {
    var existingData = await data_metter.readData("""
          SELECT * FROM products
          WHERE products_cart >= 1
      """);

    return existingData.length;
  }
}