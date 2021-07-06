class CidadesModel {
  String? nome;
  int? id;

  CidadesModel({
    this.nome,
    this.id,
  });

  CidadesModel.fromJson(Map<String, dynamic> data) {
    nome = data['nome'];
    id = data['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nome'] = nome;
    data['id'] = id;
    return data;
  }
}
