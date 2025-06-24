// carts_event.dart

abstract class CartsEvent {}

class FetchCartsEvent extends CartsEvent {}

class UpdateCartEvent extends CartsEvent {
  final int productId;
  final int quantity;

  UpdateCartEvent({required this.productId, required this.quantity});
}
