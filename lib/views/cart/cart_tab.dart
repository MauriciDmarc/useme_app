import 'package:flutter/material.dart';
import 'package:useme_app/Services/util_services.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/config/app_data.dart' as app_data;
import 'package:useme_app/models/cart_itemmodel.dart';
import 'package:useme_app/views/components/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final UtilServices utilServices = UtilServices();

  void removeItemFromCart(CartItemModel cartItemModel) {
    setState(() {
      app_data.cartitens.remove(cartItemModel);
    });
  }

  double totalPrice() {
    double total = 0;
    for (var item in app_data.cartitens) {
      total += item.totalPrice();
    }

    return total;
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text("Confirmação"),
            content: const Text("Deseja confirmar o pedido?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text("Não")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text("Sim"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Carrinho"),
        ),
        backgroundColor: CustomColors.customContrastColor,
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: app_data.cartitens.length,
                    itemBuilder: (_, index) {
                      final cartItem = app_data.cartitens[index];
                      return CartTile(
                          cartItemModel: app_data.cartitens[index],
                          updateQuantity: (qtd) {
                            if (qtd == 0) {
                              removeItemFromCart(app_data.cartitens[index]);
                            } else {
                              setState(() => cartItem.quantity = qtd);
                            }
                          });
                    })),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Total", style: TextStyle(fontSize: 18)),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(utilServices.priceToCurrency(totalPrice()),
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.deepPurpleAccent,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18))),
                        onPressed: () async {
                          bool? result = await showOrderConfirmation();

                          print(result);
                        },
                        child: const Text(
                          "Finalizar Pedido",
                          style: TextStyle(fontSize: 18),
                        )),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
