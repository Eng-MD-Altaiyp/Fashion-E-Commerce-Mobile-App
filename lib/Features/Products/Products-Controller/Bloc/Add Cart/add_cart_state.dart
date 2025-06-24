// AddCart_state.dart
import 'package:equatable/equatable.dart';

abstract class AddCartState extends Equatable {
  const AddCartState();

  @override
  List<Object> get props => [];
}

class AddCartInitial extends AddCartState {}

class AddCartLoading extends AddCartState {}

class AddCartUpdated extends AddCartState {
  final List products;

  const AddCartUpdated({required this.products});

  @override
  List<Object> get props => [products];
}

class AddCartError extends AddCartState {
  final String message;

  const AddCartError({required this.message});

  @override
  List<Object> get props => [message];
}
