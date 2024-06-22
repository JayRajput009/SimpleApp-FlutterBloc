import 'package:flutter/material.dart';
import 'package:flutterbloc/Features/Home/Models/Home_Product_model.dart';
import 'package:flutterbloc/Features/Wishlist/bloc/wishlist_bloc_bloc.dart';

class WishListProductTileWideget extends StatelessWidget {
 final ProductdataModel productdataModel;
  final  WishlistBlocBloc wishlistbloc;
  const WishListProductTileWideget({super.key, required this.productdataModel, required this.wishlistbloc});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.teal),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.teal),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      productdataModel.imageurl,
                    ))),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            productdataModel.name,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            productdataModel.description,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$  " + productdataModel.price.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                //   IconButton(
                //       onPressed: () {
                //         homebloc.add(HomeProductWishlistButtonClickedEvent(
                //             clickProduct:productdataModel
                        
                //         ));
                //       },
                //       icon: Icon(
                //         Icons.favorite_border,
                //         color: Colors.black,
                //       )),
                //   IconButton(
                //     onPressed: () {
                //         homebloc.add(HomeProductCartButtonClickedEvent(
                //             clickProduct: productdataModel
                //         ));

                //     },
                //     icon: Icon(
                //       Icons.shopping_bag_outlined,
                //       color: Colors.black,
                //     ),
                //   ),
                ],
              )
            ],
          )
        ],
      ),
    );

  }
}
