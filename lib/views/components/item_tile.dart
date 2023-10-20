import 'package:flutter/material.dart';
import 'package:useme_app/Services/util_services.dart';
import 'package:useme_app/models/item_model.dart';
import 'package:useme_app/views/home/product_screen.dart';

class ItemTile extends StatelessWidget {
  ItemTile({super.key, required this.itemModel});

  final ItemModel itemModel;
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (c) {
          return ProductScreen(
            item: itemModel,
            initialPrice: itemModel.price,
          );
        }));
      },
      child: Card(
        color: Colors.white.withAlpha(230),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Imagem
              Hero(
                  tag: itemModel.imgUrl,
                  child: Image.network(itemModel.imgUrl)),
              const Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              //Nome
              Text(
                itemModel.itemName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              //Preço - Unidade
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    utilServices.priceToCurrency(itemModel.price),
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.deepPurpleAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(" - ${itemModel.unit}")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
