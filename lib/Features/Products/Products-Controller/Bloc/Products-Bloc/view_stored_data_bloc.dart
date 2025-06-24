// product_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_state.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Models/Get-Data-Cart.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Get-Data.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<ChangeCategories>(_onChangeCategories);
    add(LoadProducts());
  }

  FetchAllProducts Data = FetchAllProducts();

  Future<void> _onLoadProducts(LoadProducts event,
      Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      Get_Cart_Products DataCart = Get_Cart_Products();
      await DataCart.GetCounterCart();
      final productsData = await Data.fetchAllProductsFromLocaleStore();
      emit(ProductLoaded(productsData));
    } catch (e) {
      emit(ProductError("فشل في تحميل المنتجات: ${e.toString()}"));
    }
  }

  Future<void> _onChangeCategories(ChangeCategories event,
      Emitter<ProductState> emit) async {

    emit(ProductLoading());
    try {
      OnSelect = event.onSelect;
      Select_Store = event.selectStore;
      final storeData = await Data.fetchAllProductsFromLocaleStore();
      emit(ProductLoaded(storeData));
    } catch (e) {
      emit(ProductError("فشل في تحديث التصنيفات: ${e.toString()}"));
    }
  }

}
