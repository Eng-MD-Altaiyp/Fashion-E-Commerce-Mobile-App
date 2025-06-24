import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';


class CartsRepository
{



  Future<List> fetchAllCarts() async {
    var readData = await data_metter.readData("""
          SELECT * FROM products
          WHERE products_cart >= 1
      """);
    // Cart_Counters.value = readData.length;
    totalProductsCart = 0;
    totalProductsPrice = 0.0;
    totalCartPrice = 0.0;
    readData.forEach((item) {
      int productsCart = item['products_cart'];
      double productsPrice = item['products_price'];

      totalProductsCart += productsCart;

      totalProductsPrice += productsPrice;

      totalCartPrice += productsCart * productsPrice;
    });

    Total = totalCartPrice;
    print('مجموع products_cart: $totalProductsCart');
    print('مجموع products_price: $totalProductsPrice');
    print(
        'المجموع الكلي (products_cart * products_price لكل عنصر): $totalCartPrice');

    return readData;
  }



  Future<List> GetCounterCart()async
  {
    var readData = await data_metter.readData("""
          SELECT * FROM products
          WHERE products_cart >= 1
      """);
    // CountersForCart.value = readData.length;
    return readData;
  }
}