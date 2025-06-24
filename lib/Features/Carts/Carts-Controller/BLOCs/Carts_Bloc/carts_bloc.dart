// carts_bloc.dart

import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-Controller/Successful_pay-Controller.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-Repository/Get-Repository-Cart.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Models/Get-Data-Cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'carts_event.dart';
import 'carts_state.dart';

class CartsBloc extends Bloc<CartsEvent, CartsState> {
  final CartsRepository fetchrepository;

  CartsBloc(this.fetchrepository,) : super(CartsInitial()) {
    on<FetchCartsEvent>(_onFetchCarts);
    on<UpdateCartEvent>(_onUpdateCart);
    add(FetchCartsEvent());
  }

  Future<void> _onFetchCarts(
      FetchCartsEvent event, Emitter<CartsState> emit) async {
    emit(CartsLoading());
    try {
      final carts = await fetchrepository.fetchAllCarts();
      emit(CartsLoaded(carts));
    } catch (e) {
      emit(CartsError("فشل في جلب سلة التسوق: ${e.toString()}"));
    }
  }

  DeleteCarts deleterepository = DeleteCarts();
  Future<void> _onUpdateCart(
      UpdateCartEvent event, Emitter<CartsState> emit) async {
    try {
      await deleterepository.DeleteRepositoryCarts(event.productId, event.quantity,false);
      final carts = await fetchrepository.fetchAllCarts();

      Get_Cart_Products Data = Get_Cart_Products();
      Data.GetCounterCart();

      Cart_Counters.value = 1;
      emit(CartsLoaded(carts));
    } catch (e) {
      emit(CartsError("فشل في تحديث سلة التسوق: ${e.toString()}"));
    }
  }
}
