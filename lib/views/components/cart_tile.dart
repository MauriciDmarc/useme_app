import 'package:flutter/material.dart';
import 'package:useme_app/Services/util_services.dart';
import 'package:useme_app/models/cart_itemmodel.dart';
import 'package:useme_app/views/components/custom_quantityitem.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItemModel;
  final Function(int) updateQuantity;
  CartTile(
      {super.key, required this.cartItemModel, required this.updateQuantity});

  final UtilServices utilServices = UtilServices();

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          widget.cartItemModel.itemModel.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(widget.cartItemModel.itemModel.itemName),
        subtitle: Text(
          widget.utilServices
              .priceToCurrency(widget.cartItemModel.totalPrice()),
          style: const TextStyle(
              color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        trailing: CustomQuantityItem(
            value: widget.cartItemModel.quantity,
            isRemovable: true,
            result: widget.updateQuantity),
      ),
    );
  }
}
