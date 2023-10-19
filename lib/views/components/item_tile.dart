import 'package:flutter/material.dart';
import 'package:useme_app/Services/util_services.dart';
import 'package:useme_app/models/item_model.dart';

class ItemTile extends StatelessWidget {
  ItemTile({super.key, required this.itemModel});

  final ItemModel itemModel;
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //Imagem
            Image.network(itemModel.imgUrl),
            //Nome
            Text(itemModel.itemName),
            //Preço - Unidade
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(utilServices.priceToCurrency(itemModel.price)),
                Text(" - ${itemModel.unit}")
              ],
            )
          ],
        ),
      ),
    );
  }
}
