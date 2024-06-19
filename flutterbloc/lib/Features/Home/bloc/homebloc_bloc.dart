import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);

    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeblocState> emit) {
    print('Wishlist product click');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeblocState> emit) {
    print('Cart product click');
  }

  FutureOr<void> homeProductWishlistButtonNavigateEvent(
      HomeProductWishlistButtonNavigateEvent event,
      Emitter<HomeblocState> emit) {
    print('Wishlist Navigate click');
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeblocState> emit) {
    print('Cart Navigate click');
    emit(HomeNavigateToCartPageActionState());
  }
}
