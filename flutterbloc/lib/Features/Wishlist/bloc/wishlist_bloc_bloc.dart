import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/Features/Home/Models/Home_Product_model.dart';
import 'package:flutterbloc/data/wishlist_data.dart';
import 'package:meta/meta.dart';

part 'wishlist_bloc_event.dart';
part 'wishlist_bloc_state.dart';

class WishlistBlocBloc extends Bloc<WishlistBlocEvent, WishlistBlocState> {
  WishlistBlocBloc() : super(WishlistBlocInitial()) {
    on<InitialWishlistEvent>(initialWishlistEvent);
  }

  FutureOr<void> initialWishlistEvent(
      InitialWishlistEvent event, Emitter<WishlistBlocState> emit) {
    emit(SuccessWishlistState(wishlistItem: wishlistItems));
  }
}
