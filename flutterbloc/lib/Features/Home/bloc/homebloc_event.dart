part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent{

}

class HomeProductCartButtonClickedEvent extends HomeblocEvent{

}

class HomeProductWishlistButtonNavigateEvent extends HomeblocEvent{

}

class HomeProductCartButtonNavigateEvent extends HomeblocEvent{

}



