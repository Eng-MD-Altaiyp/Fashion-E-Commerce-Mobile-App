// WishList_bloc.dart

import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_state.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Repository/Get-WishList-Data-Repository.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Repository/Update_wishlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishListBloc extends Bloc<WishListEvent, WishListState> {
  final GetWishListRepository repository;

  WishListBloc(this.repository) : super(WishListInitial()) {
    on<FetchWishListEvent>(_onFetchWishList);
    on<UpdateWishListEvent>(_onUpdateWishList);
    add(FetchWishListEvent());

  }


  // products_bloc.dart

  Future<void> _onUpdateWishList(
      UpdateWishListEvent event, Emitter<WishListState> emit) async {
    try {
      Update_WishList update = Update_WishList();

      var product = await data_metter.readData(
        'SELECT * FROM products WHERE products_id = ?',
        [event.productId],
      );
      if (product.isEmpty) {
        emit(WishListError(message: 'المنتج غير موجود'));
        return;
      }

      await update.updateProductWishList(event.productId, event.changedValue);

      // بعد التحديث، قم بجلب قائمة المنتجات المحدثة
      final products = await repository.fetchAllWishListFromLocaleStore();
      emit(WishListLoaded(products));
    } catch (e) {
      emit(WishListError(message: "فشل في تحديث المفضلة: ${e.toString()}"));
    }
  }






  Future<void> _onFetchWishList(
      FetchWishListEvent event, Emitter<WishListState> emit) async {
    emit(WishListLoading());
    try {
      final WishList = await repository.fetchAllWishListFromLocaleStore();
      emit(WishListLoaded(WishList));
    } catch (e) {
      emit(WishListError(message: e.toString()));
    }
  }
}
