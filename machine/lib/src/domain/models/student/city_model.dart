import 'dart:convert';

class CityModel {
  final int id;
  final String name;

  CityModel({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  String toJson() => jsonEncode(toMap());

  factory CityModel.fromMap({required Map<String, dynamic> map}) {
    return CityModel(id: map['id'] ?? 0, name: map['name'] ?? '');
  }

  factory CityModel.fromJson({required String json}) =>
      CityModel.fromMap(map: jsonDecode(json));

  factory CityModel.empty() {
    return CityModel(id: 0, name: '');
  }
}
