import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProducts extends ProductEvent {
  const LoadProducts();

  @override
  List<Object> get props => [];
}


class ChangeCategories extends ProductEvent {
  final String onSelect;
  final String selectStore;
  const ChangeCategories({required this.onSelect, required this.selectStore});


  @override
  List<Object> get props => [onSelect, selectStore];
}

class ChangedCounterCartEvent extends ProductEvent{
   final int? counter;
  final double price;
  const ChangedCounterCartEvent({required this.counter,required this.price});


  @override
  List<Object> get props => [];
}