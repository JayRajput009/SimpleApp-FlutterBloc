import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/Features/Cart/UI/cart_product_tile_wideget.dart';
import 'package:flutterbloc/Features/Cart/bloc/cart_bloc_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBlocBloc cartbloc = CartBlocBloc();
  @override
  void initState() {
    cartbloc.add(InitialCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: BlocConsumer<CartBlocBloc, CartBlocState>(
        bloc: cartbloc,
        listenWhen: (previous, current) => current is CartBlocActionState,
        buildWhen: (previous, current) => current is! CartBlocActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItem.length,
                  itemBuilder: (context, index) {
                    return CartProductTileWidget(
                      productdataModel: successState.cartItem[index],
                      cartbloc: cartbloc,
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
