// products_event.dart

abstract class WishListEvent {}

class FetchWishListEvent extends WishListEvent {}

class UpdateWishListEvent extends WishListEvent {
  final int productId;
  final int changedValue;

  UpdateWishListEvent({required this.productId, required this.changedValue, });
}