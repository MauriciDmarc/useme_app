import 'package:flutter/material.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/views/cart/cart_tab.dart';
import 'package:useme_app/views/home/home_tab.dart';
import 'package:useme_app/views/orders/orders_tab.dart';
import 'package:useme_app/views/profile/profile_tab.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final PageController pcontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
                pcontroller.jumpToPage(currentIndex);
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: CustomColors.customSwatchColor,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white30,
            items: const [
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: "Home"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.shopping_cart),
                  icon: Badge(
                      label: Text("2"),
                      child: Icon(Icons.shopping_cart_outlined)),
                  label: "Carrinho"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.list_alt),
                  icon: Icon(Icons.list_alt_outlined),
                  label: "Pedidos"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline),
                  label: "Conta")
            ]),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pcontroller,
          children: const [
            HomeTab(),
            CartScreen(),
            OrdersTab(),
            ProfileTab(),
          ],
        ));
  }
}
