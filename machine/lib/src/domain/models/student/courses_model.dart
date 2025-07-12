import 'dart:convert';

class CoursesModel {
  final int id;
  final String name;
  final bool isStudent;

  CoursesModel({required this.id, required this.name, required this.isStudent});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'isStudent': isStudent};
  }

  String toJson() => jsonEncode(toMap());

  factory CoursesModel.fromMap({required Map<String, dynamic> map}) {
    return CoursesModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      isStudent: map['isStudent'] ?? false,
    );
  }

  factory CoursesModel.fromJson({required String json}) =>
      CoursesModel.fromMap(map: jsonDecode(json));

  factory CoursesModel.empty() {
    return CoursesModel(id: 0, name: '', isStudent: false);
  }
}
