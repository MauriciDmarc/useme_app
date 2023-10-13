import 'package:flutter/material.dart';
import 'package:useme_app/components/custom_textformfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: const Column(
              children: [
                //email
                CustomTextFormField(),
                //senha
                CustomTextFormField(),
                //esqueci a senha
                //botao
              ],
            ),
          )
        ],
      ),
    );
  }
}
