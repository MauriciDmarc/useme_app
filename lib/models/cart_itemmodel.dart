import 'package:useme_app/models/item_model.dart';

class CartItemModel {
  ItemModel itemModel;
  int quantity;

  CartItemModel({required this.itemModel, required this.quantity});
}
