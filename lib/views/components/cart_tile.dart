import 'package:flutter/material.dart';
import 'package:useme_app/models/cart_itemmodel.dart';

class CartTile extends StatelessWidget {
  final CartItemModel cartItemModel;
  const CartTile({super.key, required this.cartItemModel});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(cartItemModel.itemModel.imgUrl),
    ));
  }
}
