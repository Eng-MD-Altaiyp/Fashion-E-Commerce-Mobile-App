import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';


class  AddCartRepository{
  Future<void> updateProductCart(int productId, int count) async {
    final existingProduct = await data_metter.readData(
      'SELECT * FROM products WHERE products_id = ?',
      [productId],
    );

    if (existingProduct.isEmpty) {
      print("Product with ID Cart $productId does not exist.");
      return;
    }
    await data_metter.updateData('''
    UPDATE products
    SET products_cart = ?
    WHERE products_id = ?
  ''', [
      count,
      productId,
    ]);

    print(
        "Product with ID $productId updated successfully. Cart set to $count.");
  }
}