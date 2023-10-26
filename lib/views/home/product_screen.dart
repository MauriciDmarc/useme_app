import 'package:flutter/material.dart';
import 'package:useme_app/Services/util_services.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/models/item_model.dart';
import 'package:useme_app/views/components/custom_quantityitem.dart';

// ignore: must_be_immutable
class ProductScreen extends StatefulWidget {
  ProductScreen({super.key, required this.item, required this.initialPrice});
  final ItemModel item;
  int itemQuantity = 1;
  final double initialPrice;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Column(
        children: [
          Expanded(
              child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.network(widget.item.imgUrl))),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: CustomColors.customContrastColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(40)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade600, offset: const Offset(0, 5))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //nome - qntd
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.itemName,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    CustomQuantityItem(
                        value: widget.itemQuantity,
                        result: (int quantity) {
                          setState(() {
                            widget.item.price = widget.initialPrice * quantity;
                            widget.itemQuantity = quantity;
                          });
                        })
                  ],
                ),
                //preço
                Text(
                  UtilServices().priceToCurrency(widget.item.price),
                  style: const TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                //descrição
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SingleChildScrollView(
                      child: Text(widget.item.description * 4,
                          style: const TextStyle(
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 18,
                          )),
                    ),
                  ),
                ),
                //botão
                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text(
                        "Adicionar ao Carrinho",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 20),
                      )),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
