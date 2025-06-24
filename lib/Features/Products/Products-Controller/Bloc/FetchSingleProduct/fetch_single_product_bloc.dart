import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/SingleProductRepository.dart';
import 'package:meta/meta.dart';

part 'fetch_single_product_event.dart';
part 'fetch_single_product_state.dart';

class FetchSingleProductBloc extends Bloc<FetchSingleProductEvent, FetchSingleProductState> {
  final int ProductId;
  FetchSingleProductBloc({required this.ProductId}) : super(FetchSingleProductInitial()) {
    on<LoadFetchSingleProduct>(_onLoadProducts);
    add(LoadFetchSingleProduct(ProductId: ProductId));

  }

  Future<void> _onLoadProducts(LoadFetchSingleProduct event,
      Emitter<FetchSingleProductState> emit) async {
    emit(FetchSingleProductLoading());
    try {
      SingleProductRepository Data = SingleProductRepository();
      final productsData = await Data.FetchSingleProduct(event.ProductId);
      emit(FetchSingleProductLoaded(productsData));
    } catch (e) {
      emit(FetchSingleProductError("فشل في تحميل المنتجات: ${e.toString()}"));
    }
  }
}
