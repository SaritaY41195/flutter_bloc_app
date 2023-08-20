import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/features/home/models/home_product_data_model.dart';
import 'package:flutter_bloc_app/features/wishlist/bloc/wishlist_bloc.dart';

class WishListTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final WishlistBloc wishlistBloc;
  const WishListTileWidget(
      {super.key, required this.productDataModel, required this.wishlistBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal.shade200),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(productDataModel.description),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${productDataModel.price.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18)),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(WishListToHomeNavigateEvent());
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(WishlistRemoveFromWishlistEvent(
                          productDataModel: productDataModel));
                    },
                    icon: const Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
