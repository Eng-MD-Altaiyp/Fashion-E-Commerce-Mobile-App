import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';


class Update_WishList {

  Future<int> updateProductFavorite(
      int id, int favoriteValue) async
  {
    final existingProduct = await data_metter.readData(
      'SELECT * FROM products WHERE products_id = ?',
      [id],
    );

    if (existingProduct.isEmpty) {
      print("Product with Name $id does not exist.");
      return 0;
    }
    await data_metter.updateData('''
    UPDATE products
    SET products_favorite = ?
    WHERE products_id = ?
  ''', [
      favoriteValue,
      id,
    ]);
    print(
        "Product with id $id updated successfully. Favorite set to $favoriteValue.");
    print('llllllllllllllllllllll $existingProduct');
    return 1;
  }
}
