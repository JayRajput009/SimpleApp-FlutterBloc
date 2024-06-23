// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Features/Wishlist/UI/wishlist_product_tile_wideget.dart';
import 'package:flutterbloc/Features/Wishlist/bloc/wishlist_bloc_bloc.dart';

// import 'package:flutterbloc/data/wishlist_data.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final WishlistBlocBloc wishlistbloc = WishlistBlocBloc();
  @override
  void initState() {
    wishlistbloc.add(InitialWishlistEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text('Wishlist Items',
            style: TextStyle(
                color: Colors.white
            ),
            ),
        ),
      body: BlocConsumer<WishlistBlocBloc, WishlistBlocState>(
        listener: (context, state) {},
        bloc: wishlistbloc,
        listenWhen: (previous, current) => current is WishlistBlocActionState,
        buildWhen: (previous, current) => current is! WishlistBlocActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case SuccessWishlistState:
              final successState = state as SuccessWishlistState;
              return ListView.builder(
                  itemCount: successState.wishlistItem.length,
                  itemBuilder: (context, index) {
                    return WishListProductTileWideget(
                      productdataModel: successState.wishlistItem[index],
                      wishlistbloc: wishlistbloc,
                    );
                  });

              
            default:
          }
          return Container();
        },
      ),
    );
  }
}
