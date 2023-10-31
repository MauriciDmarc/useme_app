import 'package:flutter/material.dart';
import 'package:useme_app/views/components/custom_textformfield.dart';
import 'package:useme_app/config/app_data.dart' as app_data;

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
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
        children: [
          //email
          CustomTextFormField(
            iconData: Icons.email,
            label: "Email",
            keyboardType: TextInputType.emailAddress,
            initalValue: app_data.user.email,
          ),
          //senha
          CustomTextFormField(
            iconData: Icons.password,
            label: "Senha",
            visibility: true,
            initalValue: app_data.user.senha,
          ),
          //nome
          CustomTextFormField(
            iconData: Icons.person,
            label: "Nome",
            initalValue: app_data.user.nome,
          ),
          //celular
          CustomTextFormField(
            iconData: Icons.phone,
            label: "Celular",
            keyboardType: TextInputType.phone,
            initalValue: app_data.user.celular.toString(),
          ),
          //CPF
          CustomTextFormField(
            iconData: Icons.document_scanner,
            label: "CPF",
            keyboardType: TextInputType.number,
            visibility: true,
            initalValue: app_data.user.cpf.toString(),
          ),
          //endereço
          CustomTextFormField(
            iconData: Icons.house,
            label: "Endereço",
            initalValue: app_data.user.endereco,
          ),
          //numero
          CustomTextFormField(
            iconData: Icons.numbers,
            label: "Número",
            initalValue: app_data.user.numero.toString(),
          ),
          SizedBox(
              height: 50,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.deepPurple),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: () {
                    updatePassword();
                  },
                  child: const Text(
                    "Atualizar Perfil",
                    style: TextStyle(fontSize: 26),
                  )))
        ],
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text("Atualizar Senha", style: TextStyle(fontSize: 24)),
                  const CustomTextFormField(
                    iconData: Icons.lock,
                    label: "Senha Atual",
                    visibility: true,
                  ),
                  const CustomTextFormField(
                      iconData: Icons.password, label: "Nova Senha"),
                  const CustomTextFormField(
                      iconData: Icons.password_outlined,
                      label: "Confirmar Nova Senha"),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        "Atualizar",
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
