// add_cart_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/whislist_bloc/favorite_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/whislist_bloc/favorite_state.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Get-WishList-Data.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Update_wishlist.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {

  FavoriteBloc() : super(FavoriteInitial()) {
    on<ToggleFavorite>(_onToggleFavorite);
    on<LoadFavorite>(_onLoadProducts);
    add(LoadFavorite());

  }


  GetWishList Data = GetWishList();
  Future<void> _onToggleFavorite(
      ToggleFavorite event, Emitter<FavoriteState> emit) async
  {
    emit(FavoriteLoading());
    try {

      Update_WishList update = Update_WishList();

      var product = await data_metter.readData(
        'SELECT * FROM products WHERE products_id = ?',
        [event.productId],
      );
      if (product.isEmpty) {
        emit(FavoriteError(message: "المنتج غير موجود"));
        return;
      }

          await update.updateProductFavorite(event.productId, event.ChangedValue);

      emit(FavoriteUpdated(products: product));
    } catch (e) {
      emit(FavoriteError(message: "فشل في تحديث المفضلة: ${e.toString()}"));
    }
  }


  Future<void> _onLoadProducts(LoadFavorite event,
      Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {

      final productsData = await Data.fetchAllProductsWishListFromLocaleStore();
      emit(FavoriteLoaded(productsData));
    } catch (e) {
      emit(FavoriteError(message: "فشل في تحميل المنتجات: ${e.toString()}"));
    }
  }
}
