import 'dart:convert';

class ZipCodeAddressModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String estado;
  final String ibge;

  ZipCodeAddressModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.ibge,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'estado': estado,
      'ibge': ibge,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ZipCodeAddressModel.fromMap({required Map<String, dynamic> map}) {
    return ZipCodeAddressModel(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      estado: map['estado'] ?? '',
      ibge: map['ibge'] ?? '',
    );
  }

  factory ZipCodeAddressModel.fromJson({required String json}) =>
      ZipCodeAddressModel.fromMap(map: jsonDecode(json));

  factory ZipCodeAddressModel.empty() {
    return ZipCodeAddressModel(
      cep: '',
      logradouro: '',
      bairro: '',
      localidade: '',
      uf: '',
      estado: '',
      ibge: '',
    );
  }
}
