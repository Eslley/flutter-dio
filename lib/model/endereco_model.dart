import 'dart:convert';

class EnderecoModel {
  EnderecoModel(
      {required this.cep,
      required this.logradouro,
      required this.bairro,
      required this.localidade,
      required this.uf});

  String cep;
  String logradouro;
  String bairro;
  String localidade;
  String uf;

  factory EnderecoModel.fromJson(Map<String, dynamic> json) => EnderecoModel(
      cep: json['cep'],
      logradouro: json['logradouro'],
      bairro: json['bairro'],
      localidade: json['localidade'],
      uf: json['uf']);

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf
      };
}
