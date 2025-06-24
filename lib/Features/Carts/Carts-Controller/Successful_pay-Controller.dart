import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';

class DeleteCarts {
  Future<void> DeleteRepositoryCarts(int productId, int quantity,bool Type) async {
    final existingProduct = await data_metter.readData(
      'SELECT * FROM products WHERE products_cart >= 1',
    );

    if (existingProduct.isEmpty) {
      print("Product Carts does not exist.");
      return;
    }

if(Type == false)
    {
      await data_metter.updateData(
        '''
    UPDATE products
    SET products_cart = ?
    WHERE products_id = ?
  ''',
        [
          0,
          productId,
        ],
      );
    }
else{
  await data_metter.updateData(
    '''
    UPDATE products
    SET products_cart = ?
    WHERE products_id >= ?
  ''',
    [
      0,
      productId,
    ],
  );
}

    print("Product updated successfully. Cart set to 0.");
  }
}
