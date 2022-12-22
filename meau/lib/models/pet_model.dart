class CreatePetModel {
  CreatePetModel(
      this.nome,
      this.especie,
      this.sexo,
      this.porte,
      this.idade,
      this.temperamento,
      this.saude,
      this.doencas,
      this.exigencias,
      this.sobre,
      this.ownerId,
      this.isAdopt,
      this.isFoster,
      this.isHelp,
      this.picture);
  final String nome;
  final String especie;
  final String sexo;
  final String porte;
  final String idade;
  final String temperamento;
  final String saude;
  final String doencas;
  final String exigencias;
  final String sobre;
  final String ownerId;
  final bool isAdopt;
  final bool isFoster;
  final bool isHelp;
  final String picture;
}

class PetModel {
  PetModel({
    this.id = "",
    this.nome = "",
    this.especie = "",
    this.sexo = "",
    this.porte = "",
    this.idade = "",
    this.temperamento = "",
    this.saude = "",
    this.doencas = "",
    this.exigencias = "",
    this.necessidades = "",
    this.sobre = "",
    this.ownerId = "",
    this.isAdopt = false,
    this.isFoster = false,
    this.isHelp = false,
  });

  String id;
  String nome;
  String especie;
  String sexo;
  String porte;
  String idade;
  String temperamento;
  String saude;
  String doencas;
  String exigencias;
  String necessidades;
  String sobre;
  String ownerId;
  bool isAdopt;
  bool isFoster;
  bool isHelp;
}
