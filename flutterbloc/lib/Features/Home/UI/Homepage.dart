// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Features/Home/bloc/homebloc_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeblocBloc homebloc = HomeblocBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeblocBloc, HomeblocState>(
      bloc: homebloc,
      //   listenWhen:(previous, current) {

      //   },
      //   buildWhen: (previous, current) {

      //   },
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Grocery app'),
            actions: [
              IconButton(
                  onPressed: () {
                    homebloc.add(HomeProductWishlistButtonNavigateEvent());
                  },
                  icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {
                    homebloc.add(HomeProductCartButtonNavigateEvent());
                  },
                  icon: Icon(Icons.shopping_bag_outlined))
            ],
          ),
        );
      },
    );
  }
}
