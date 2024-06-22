part of 'cart_bloc_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartBlocActionState {}

final class CartBlocInitial extends CartBlocState {}

class CartInitialState extends CartBlocState {}

class CartSuccessState extends CartBlocState {
  final List<ProductdataModel> cartItem;

  CartSuccessState({required this.cartItem});
}
