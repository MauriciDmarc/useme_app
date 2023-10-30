import 'package:flutter/material.dart';
import 'package:useme_app/config/custom_colors.dart';
import 'package:useme_app/views/components/custom_textformfield.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.logout))],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(8),
        children: const [
          //email
          CustomTextFormField(
            iconData: Icons.email,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          //senha
          CustomTextFormField(
            iconData: Icons.password,
            label: "Senha",
            visibility: true,
          ),
          //nome
          CustomTextFormField(iconData: Icons.person, label: "Nome"),
          //celular
          CustomTextFormField(
            iconData: Icons.phone,
            label: "Celular",
            keyboardType: TextInputType.phone,
          ),
          //CPF
          CustomTextFormField(
            iconData: Icons.document_scanner,
            label: "CPF",
            keyboardType: TextInputType.number,
            visibility: true,
          ),
          //endereço
          CustomTextFormField(iconData: Icons.house, label: "Endereço"),
          //numero
          CustomTextFormField(iconData: Icons.numbers, label: "Número")
        ],
      ),
    );
  }
}
