class RegioesModel {
  String? nome;
  String? sigla;
  int? id;

  RegioesModel({
    this.nome,
    this.sigla,
    this.id,
  });

  RegioesModel.fromJson(Map<String, dynamic> data) {
    nome = data['nome'];
    sigla = data['sigla'];
    id = data['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nome'] = nome;
    data['sigla'] = sigla;
    data['id'] = id;
    return data;
  }
}
