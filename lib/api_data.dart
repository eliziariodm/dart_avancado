import 'package:dart_avancado/repositories/cidades_repository.dart';
import 'package:dart_avancado/repositories/estados_repository.dart';
import 'package:dart_avancado/repositories/regioes_repository.dart';
import 'package:dart_avancado/mysql.dart' as mysql;

Future<void> run() async {
  await cadastro();
}

Future<void> cadastro() async {
  var regioes = await RegioesRepository().buscarRegioes();

  await Future.forEach(regioes, (dynamic regiao) async {
    await mysql.cadastrarRegioes(regiao.nome, regiao.sigla, regiao.id);
  });

  var estados = await EstadosRepository().buscarEstados();

  await Future.forEach(estados, (dynamic estado) async {
    await mysql.cadastrarEstados(estado.nome, estado.sigla, estado.id);

    var cidades = await CidadesRepository().buscarCidades(estado.id);
    await mysql.cadastrarCidades(cidades, estado.id);
  });
}
