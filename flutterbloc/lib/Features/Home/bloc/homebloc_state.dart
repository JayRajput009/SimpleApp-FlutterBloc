part of 'homebloc_bloc.dart';

@immutable
abstract class HomeblocState {}

abstract class HomeblocActionState extends HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

class HomeLoadingState extends HomeblocState {}

class HomeLoadedSuccessState extends HomeblocState {}

class HomeErrorState extends HomeblocState {}

class HomeNavigateToWishlistPageActionState extends HomeblocActionState {}

class HomeNavigateToCartPageActionState extends HomeblocActionState {}

