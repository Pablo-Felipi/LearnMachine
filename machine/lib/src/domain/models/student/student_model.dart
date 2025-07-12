import 'dart:convert';
import 'package:learn_machine/src/domain/models/student/address_model.dart';
import 'package:learn_machine/src/domain/models/student/courses_model.dart';

class StudentModel {
  final int? id;
  final String name;
  final int? age;
  final List<String> nameCourses;
  final AddressModel address;
  final List<CoursesModel> courses;

  StudentModel({
    this.id,
    required this.name,
    required this.age,
    required this.nameCourses,
    required this.address,
    required this.courses,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'nameCourses': nameCourses,
      'address': address.toMap(),
      'courses': courses.map((course) => course.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory StudentModel.fromMap({required Map<String, dynamic> map}) {
    return StudentModel(
      id: map['id'],
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      nameCourses: List<String>.from(map['nameCourses'] ?? <String>[]),
      address: AddressModel.fromMap(map: map['address']?? AddressModel.empty()),
      courses:
          map['courses'].map<CoursesModel>((courseItem) {
            return CoursesModel.fromMap(map: courseItem);
          }).toList() ??
          <CoursesModel>[],
    );
  }

  factory StudentModel.fromJson({required String json}) =>
      StudentModel.fromMap(map: jsonDecode(json));

  factory StudentModel.empty() {
    return StudentModel(
      name: '',
      age: 0,
      nameCourses: <String>[],
      address: AddressModel.empty(),
      courses: [CoursesModel.empty()],
    );
  }
}
