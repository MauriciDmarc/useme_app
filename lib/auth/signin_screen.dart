import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white70,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: const Column(
                  //email
                  //senha
                  //esqueci a senha
                  //botao
                  ),
            ),
          )
        ],
      ),
    );
  }
}
