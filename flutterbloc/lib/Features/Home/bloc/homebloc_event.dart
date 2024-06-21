part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}

class HomeInitialEvent extends HomeblocEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent {
  final ProductdataModel clickProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickProduct});
  
}

class HomeProductCartButtonClickedEvent extends HomeblocEvent {
  final ProductdataModel clickProduct;

  HomeProductCartButtonClickedEvent({required this.clickProduct});

}

class HomeProductWishlistButtonNavigateEvent extends HomeblocEvent {}

class HomeProductCartButtonNavigateEvent extends HomeblocEvent {}
