import 'package:useme_app/models/cart_itemmodel.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  List<CartItemModel> items;
  String status;
  String copyPastePix;
  double total;

  OrderModel(
      {required this.id,
      required this.createdDateTime,
      required this.overdueDateTime,
      required this.items,
      required this.status,
      required this.copyPastePix,
      this.total = 0.1});

  double calculateTotal() {
    for (var item in items) {
      total += item.itemModel.price * item.quantity;
    }
    return total;
  }
}
