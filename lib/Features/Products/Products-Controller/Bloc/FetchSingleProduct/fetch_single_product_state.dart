part of 'fetch_single_product_bloc.dart';

@immutable


abstract class FetchSingleProductState extends Equatable {
  const FetchSingleProductState();

  @override
  List<Object> get props => [];
}
final class FetchSingleProductInitial extends FetchSingleProductState {}


class FetchSingleProductLoading extends FetchSingleProductState {}


class FetchSingleProductLoaded extends FetchSingleProductState {
  final List products;

  const FetchSingleProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class FetchSingleProductError extends FetchSingleProductState {
  final String message;

  const FetchSingleProductError(this.message);

  @override
  List<Object> get props => [message];
}