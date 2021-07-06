class EstadosModel {
  String? nome;
  String? sigla;
  int? id;

  EstadosModel({
    this.nome,
    this.sigla,
    this.id,
  });

  EstadosModel.fromJson(Map<String, dynamic> data) {
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
