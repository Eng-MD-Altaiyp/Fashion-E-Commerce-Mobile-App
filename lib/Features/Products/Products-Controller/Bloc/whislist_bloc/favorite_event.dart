import 'package:equatable/equatable.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavorite extends FavoriteEvent {
  final int productId;
  final int ChangedValue;

  const ToggleFavorite({required this.productId,required this.ChangedValue});

  @override
  List<Object> get props => [productId];
}

class LoadFavorite extends FavoriteEvent {
  const LoadFavorite();

  @override
  List<Object> get props => [];
}