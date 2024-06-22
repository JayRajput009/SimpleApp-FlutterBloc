part of 'wishlist_bloc_bloc.dart';

@immutable
abstract class WishlistBlocState {}

abstract class WishlistBlocActionState extends WishlistBlocState {}

final class WishlistBlocInitial extends WishlistBlocState {}

class InitialWishliststate extends WishlistBlocState {}

class SuccessWishlistState extends WishlistBlocActionState {
  final List<ProductdataModel> wishlistitem;

  SuccessWishlistState({required this.wishlistitem});
}
