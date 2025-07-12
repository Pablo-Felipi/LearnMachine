import 'dart:convert';

class ActiveCoursesModel {
  final int id;
  final String name;

  ActiveCoursesModel({required this.id, required this.name});

  factory ActiveCoursesModel.fromMap({required Map<String, dynamic> map}) {
    return ActiveCoursesModel(id: map['id'] ?? 0, name: map['name'] ?? '');
  }

  factory ActiveCoursesModel.fromJson({required String json}) =>
      ActiveCoursesModel.fromMap(map: jsonDecode(json));
}
