// product_state.dart
import 'package:equatable/equatable.dart';


abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}


class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  final List products;

  const ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}


class ProductError extends ProductState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object> get props => [message];
}






