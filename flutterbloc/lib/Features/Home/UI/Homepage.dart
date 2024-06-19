// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Features/Cart/UI/cartpage.dart';
import 'package:flutterbloc/Features/Home/bloc/homebloc_bloc.dart';
import 'package:flutterbloc/Features/Wishlist/UI/wishlistpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeblocBloc homebloc = HomeblocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      bloc: homebloc,
      listenWhen: (previous, current) => current is HomeblocActionState,
      buildWhen: (previous, current) => current is! HomeblocActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => WishlistPage())));
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CartPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSuccessState:
            return Scaffold(
              backgroundColor: Colors.teal.withOpacity(0.175),
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text(
                  'Grocery app',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        homebloc.add(HomeProductWishlistButtonNavigateEvent());
                      },
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                    onPressed: () {
                      homebloc.add(HomeProductCartButtonNavigateEvent());
                    },
                    icon: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );

          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text('Error Message'),
              ),
            );

          default:
            return Scaffold(
                body: SizedBox(),
            );
        }
      },
    );
  }
}
