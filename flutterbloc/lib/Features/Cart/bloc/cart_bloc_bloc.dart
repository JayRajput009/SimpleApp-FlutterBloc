import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutterbloc/Features/Home/Models/Home_Product_model.dart';
import 'package:flutterbloc/data/cart_data.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBlocBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBlocBloc() : super(CartBlocInitial()) {
    on<InitialCartEvent>(initialCartEvent);
  }

  FutureOr<void> initialCartEvent(
      InitialCartEvent event, Emitter<CartBlocState> emit) {
    emit(CartSuccessState(cartItem: cartItems));
  }
}
 