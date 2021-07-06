import 'package:dart_avancado/models/cidades_model.dart';
import 'package:dio/dio.dart';

class CidadesRepository {
  Future<List<CidadesModel>> buscarCidades(int idEstados) async {
    try {
      final dio = Dio();
      var url =
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$idEstados/distritos';
      final response = await dio.get(url);
      final _cidadesList = response.data as List;
      return _cidadesList.map((json) => CidadesModel.fromJson(json)).toList();
    } catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    }
  }
}
