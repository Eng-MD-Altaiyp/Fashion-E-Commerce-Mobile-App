part of 'fetch_single_product_bloc.dart';

@immutable

abstract class FetchSingleProductEvent extends Equatable {
  const FetchSingleProductEvent();
}

class LoadFetchSingleProduct extends FetchSingleProductEvent {
  final int ProductId;
  const LoadFetchSingleProduct({required this.ProductId});

  @override
  List<Object> get props => [];
}