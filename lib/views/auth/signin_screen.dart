import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/views/components/custom_textformfield.dart';

class SignInScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customContrastColor,
      body: Column(
        children: [
          //logo
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'image/logo.png',
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  height: 30,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                    child: Center(
                      child: AnimatedTextKit(
                          repeatForever: true,
                          pause: Duration.zero,
                          animatedTexts: [
                            FadeAnimatedText("Suplementos"),
                            FadeAnimatedText("Roupas"),
                            FadeAnimatedText("Produtos Naturais"),
                          ]),
                    ),
                  ),
                )
              ],
            ),
          )),
          //formulario
          Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //email
                  CustomTextFormField(
                    textEditingController: emailController,
                    iconData: Icons.email,
                    label: "Email",
                    validator: (email) {
                      if (email == null || email.isEmpty)
                        return "Digite um Email";

                      if (email.isEmail) return "Digite um Email Válido";

                      return null;
                    },
                  ),
                  //senha
                  CustomTextFormField(
                    textEditingController: senhaController,
                    iconData: Icons.password,
                    label: "Senha",
                    visibility: true,
                    validator: (senha) {
                      if (senha == null || senha.isEmpty)
                        return "Digite uma Senha";
                      if (senha.length < 8)
                        return "Sua senha precisa ser maior que 8 caracteres";
                      return null;
                    },
                  ),
                  //botao entrar
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 4),
                    child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                String emailText = emailController.text;
                                String senhaText = senhaController.text;

                                print(emailText + " - " + senhaText);
                              } else {
                                print("Campos vazios");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16))),
                            child: const Text(
                              "ENTRAR",
                              style: TextStyle(fontSize: 18),
                            ))),
                  ),
                  //esqueci a senha
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Esqueci a senha",
                        style: TextStyle(color: Colors.blue),
                      )),
                  //divisor
                  const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Row(children: [
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        endIndent: 8,
                      )),
                      Text(
                        "Ou",
                        style: TextStyle(color: Colors.black54),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 2,
                        indent: 8,
                      ))
                    ]),
                  ),
                  //botao criar
                  SizedBox(
                      height: 50,
                      child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2, color: Colors.deepPurple),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          child: const Text(
                            "CRIAR CONTA",
                            style: TextStyle(fontSize: 16),
                          ))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
