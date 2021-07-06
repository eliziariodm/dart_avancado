import 'package:dart_avancado/models/regioes_model.dart';
import 'package:dio/dio.dart';

class RegioesRepository {
  Future<List<RegioesModel>> buscarRegioes() async {
    try {
      var dio = Dio();
      var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/regioes';
      final response = await dio.get(url);
      final _regioesList = response.data as List;

      return _regioesList.map((json) => RegioesModel.fromJson(json)).toList();
    } catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    }
  }
}
