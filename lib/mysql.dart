import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  var settings = ConnectionSettings(
    host: 'localhost',
    port: 3306,
    user: '', //coloque aqui seu usuário
    password: '', //coloque aqui sua senha
    db: '', // nome de seu banco de dados
  );
  return await MySqlConnection.connect(settings);
}

Future<void> cadastrarEstados(
    String nomeEstado, String siglaEstado, int idEstado) async {
  var conn = await getConnection();
  try {
    await conn.query(
      'insert estados (cd_estados, nome_estado, sigla_estado, id_estado) values (null, ?, ?, ?)',
      [nomeEstado, siglaEstado, idEstado],
    );
  } catch (e, s) {
    print(e);
    print(s);
  } finally {
    await conn.close();
  }
}

Future<void> cadastrarRegioes(
    String nomeRegiao, String siglaRegiao, int idRegiao) async {
  var conn = await getConnection();
  try {
    await conn.query(
      'insert regioes (cd_regioes, nome_regiao, sigla_regiao, id_regiao) values (null, ?, ?, ?)',
      [nomeRegiao, siglaRegiao, idRegiao],
    );
  } catch (e, s) {
    print(e);
    print(s);
  } finally {
    await conn.close();
  }
}

Future<void> cadastrarCidades(List<dynamic> nomeCidade, int idEstado) async {
  var conn = await getConnection();
  try {
    await Future.forEach(nomeCidade, (dynamic cidade) async {
      await conn.query(
        'insert cidades (cd_cidades, nome_cidade, id_estado) values (null, ?, ?)',
        [cidade.nome, idEstado],
      );
    });
  } catch (e, s) {
    print(e);
    print(s);
  } finally {
    await conn.close();
  }
}
