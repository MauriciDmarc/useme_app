class UserModel {
  String email;
  String senha;
  String nome;
  int celular;
  int cpf;
  String endereco;
  int numero;

  UserModel(
      {required this.celular,
      required this.cpf,
      required this.email,
      required this.endereco,
      required this.nome,
      required this.numero,
      required this.senha});
}
