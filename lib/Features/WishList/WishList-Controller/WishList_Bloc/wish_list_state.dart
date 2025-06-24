// WishList_state.dart

abstract class WishListState {}

class WishListInitial extends WishListState {}

class WishListLoading extends WishListState {}

class WishListLoaded extends WishListState {
  final List WishList;

  WishListLoaded(this.WishList);
}

class WishListError extends WishListState {
  final String message;

  WishListError({required  this.message});

}

class WishListUpdated extends WishListState {
  final dynamic wishList;

  WishListUpdated({required this.wishList});
}


