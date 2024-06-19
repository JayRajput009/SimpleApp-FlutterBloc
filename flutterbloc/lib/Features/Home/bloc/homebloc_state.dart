part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

abstract class HomeblocActionState extends HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

class HomeLoadingState extends HomeblocState {}

class HomeLoadedSuccessState extends HomeblocState {
  final List<ProductdataModel> products;

  HomeLoadedSuccessState({required this.products});


}

class HomeErrorState extends HomeblocState {}

class HomeNavigateToWishlistPageActionState extends HomeblocActionState {}

class HomeNavigateToCartPageActionState extends HomeblocActionState {}
