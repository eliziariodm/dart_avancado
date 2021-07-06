import 'package:dart_avancado/models/estados_model.dart';
import 'package:dio/dio.dart';

class EstadosRepository {
  Future<List<EstadosModel>> buscarEstados() async {
    try {
      var dio = Dio();
      var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
      final response = await dio.get(url);
      final _estadosList = response.data as List;

      return _estadosList.map((json) => EstadosModel.fromJson(json)).toList();
    } catch (e, s) {
      print(e);
      print(s);
      throw Exception();
    }
  }
}
