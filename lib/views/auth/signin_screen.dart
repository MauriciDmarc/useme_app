import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/views/base/base_screen.dart';
import 'package:useme_app/views/components/custom_textformfield.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //email
                const CustomTextFormField(
                  iconData: Icons.email,
                  label: "Email",
                ),
                //senha
                const CustomTextFormField(
                  iconData: Icons.password,
                  label: "Senha",
                  visibility: true,
                ),
                //botao entrar
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (c) {
                              return const BaseScreen();
                            }));
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
          )
        ],
      ),
    );
  }
}
