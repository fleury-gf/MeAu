class CreateUserModel {
  CreateUserModel(
      this.nome,
      this.idade,
      this.email,
      this.estado,
      this.cidade,
      this.endereco,
      this.telefone,
      this.username,
      this.password,
      this.passwordConfirm,
      this.picture);
  final String nome;
  final String idade;
  final String email;
  final String estado;
  final String cidade;
  final String endereco;
  final String telefone;
  final String username;
  final String password;
  final String passwordConfirm;
  final String picture;
}

class UserModel {
  UserModel({
    this.id = "",
    this.nome = "",
    this.idade = "",
    this.email = "",
    this.estado = "",
    this.cidade = "",
    this.endereco = "",
    this.telefone = "",
    this.username = "",
    this.picture = "",
  });

  String id;
  String nome;
  String idade;
  String email;
  String estado;
  String cidade;
  String endereco;
  String telefone;
  String username;
  String picture;
}
