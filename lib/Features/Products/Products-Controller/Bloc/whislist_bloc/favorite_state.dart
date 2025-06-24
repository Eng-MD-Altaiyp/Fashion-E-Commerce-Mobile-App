// add_cart_state.dart
import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteUpdated extends FavoriteState {
  final List products;

  const FavoriteUpdated({required this.products});

  @override
  List<Object> get props => [products];
}

class FavoriteError extends FavoriteState {
  final String message;

  const FavoriteError({required this.message});

  @override
  List<Object> get props => [message];
}

class FavoriteLoaded extends FavoriteState {
  final List products;

  const FavoriteLoaded(this.products);

  @override
  List<Object> get props => [products];
}
