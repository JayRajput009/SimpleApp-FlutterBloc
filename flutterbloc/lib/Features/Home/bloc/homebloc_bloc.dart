import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/Data/grocery_data.dart';
import 'package:flutterbloc/Features/Home/Models/Home_Product_model.dart';
import 'package:flutterbloc/data/cart_data.dart';
import 'package:flutterbloc/data/wishlist_data.dart';
import 'package:meta/meta.dart';

part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeProductWishlistButtonNavigateEvent>(
        homeProductWishlistButtonNavigateEvent);

    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeblocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.grocerydata
            .map((e) => ProductdataModel(
                id: e['id'],
                name: e['name'],
                description: e['description'],
                imageurl: e['imageurl'],
                price: e['price']))
            .toList()));
  }
}

FutureOr<void> homeProductWishlistButtonClickedEvent(
    HomeProductWishlistButtonClickedEvent event, Emitter<HomeblocState> emit) {
  print('Wishlist product click');
  wishlistItems.add(event.clickProduct);
  emit(HomeProductWishlistButtonClickState());
}

FutureOr<void> homeProductCartButtonClickedEvent(
    HomeProductCartButtonClickedEvent event, Emitter<HomeblocState> emit) {
  print('Cart product click');
  cartItems.add(event.clickProduct);
  emit(HomeProductCartButtonClickState());
}

FutureOr<void> homeProductWishlistButtonNavigateEvent(
    HomeProductWishlistButtonNavigateEvent event, Emitter<HomeblocState> emit) {
  print('Wishlist Navigate click');
  emit(HomeNavigateToWishlistPageActionState());
}

FutureOr<void> homeProductCartButtonNavigateEvent(
    HomeProductCartButtonNavigateEvent event, Emitter<HomeblocState> emit) {
  print('Cart Navigate click');
  emit(HomeNavigateToCartPageActionState());
}
