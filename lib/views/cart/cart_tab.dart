import 'package:flutter/material.dart';
import 'package:useme_app/Services/util_services.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/config/app_data.dart' as app_data;
import 'package:useme_app/views/components/cart_tile.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final UtilServices utilServices = UtilServices();

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
                      return CartTile(cartItemModel: app_data.cartitens[index]);
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
                    child: Text(utilServices.priceToCurrency(50.98),
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
                        onPressed: () {},
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
