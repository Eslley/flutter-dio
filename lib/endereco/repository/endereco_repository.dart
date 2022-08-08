import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projeto_exemplo/model/endereco_model.dart';

class EnderecoRepository {
  Dio dio = Dio();

  Future<EnderecoModel> getEndereco({required String cep}) async {
    final response =
        await dio.get('https://viacep.com.br/ws/' + cep + '/json/');

    if (response.statusCode == 200) {
      print(response.data);

      return EnderecoModel.fromJson(response.data);
    } else {
      print(response);
      throw Exception("Falha ao carregar endereço");
    }
  }
}
