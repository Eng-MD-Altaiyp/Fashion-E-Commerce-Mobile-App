import 'package:equatable/equatable.dart';

abstract class AddCartEvent extends Equatable {
  const AddCartEvent();

  @override
  List<Object> get props => [];
}

class ToggleAddCart extends AddCartEvent {
  final int productId;
  final int ChangedValue;

  const ToggleAddCart({required this.productId,required this.ChangedValue});

  @override
  List<Object> get props => [productId];
}
