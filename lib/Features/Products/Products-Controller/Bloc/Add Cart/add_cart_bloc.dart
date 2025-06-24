// add_cart_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_state.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Models/Get-Data-Cart.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Add-Cart-Repository.dart';

class AddCartBloc extends Bloc<AddCartEvent, AddCartState> {

  AddCartBloc() : super(AddCartInitial()) {
    on<ToggleAddCart>(_onToggleAddCart);
  }


  AddCartRepository Data = AddCartRepository();
  Future<void> _onToggleAddCart(
      ToggleAddCart event, Emitter<AddCartState> emit) async {
    emit(AddCartLoading());
    try {

      var product = await data_metter.readData(
        'SELECT * FROM products WHERE products_id = ?',
        [event.productId],
      );
      if (product.isEmpty) {
        emit(AddCartError(message: "المنتج غير موجود"));
        return;
      }
      Get_Cart_Products DataCounterCart = Get_Cart_Products();
     await DataCounterCart.GetCounterCart();
      await Data.updateProductCart(event.productId, event.ChangedValue);

      emit(AddCartUpdated(products: product));
    } catch (e) {
      emit(AddCartError(message: "فشل في تحديث المفضلة: ${e.toString()}"));
    }
  }
}
