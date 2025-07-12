import 'dart:convert';

import 'package:machine/src/domain/models/student/student_model.dart';
import 'package:machine/src/interfaces/student/interface_http_client_student.dart';
import 'package:machine/src/interfaces/student/interface_student_repository.dart';


class StudentRepository implements InterfaceStudentRepository {
  final InterfaceHttpClientStudent client;
  final String urlBase;

  StudentRepository({required this.client, required this.urlBase});

  @override
  Future getStudent() async {
    final apiResponse = await client.getData(url: urlBase);
    final List<StudentModel> students = <StudentModel>[];

    if (apiResponse.statusCode != 200) {
      throw Exception('fail to connect Student API ');
    }
    final body = jsonDecode(apiResponse.body);

    for (var student in body) {
      students.add(StudentModel.fromMap(map: student));
    }

    return students;
  }

  @override
  Future createStudent({required Map<String, dynamic> map}) async {
    final apiResponse = await client.createData(url: urlBase, map: map);

    if (apiResponse.statusCode != 200) {
      throw Exception('fail to create student');
    }
  }

  @override
  Future deleteStudent({required int id}) async {
    final apiResponse = await client.deleteData(url: urlBase, id: id);

    if (apiResponse.statusCode != 200) {
      throw Exception('fail to delete student');
    }
  }

  @override
  Future updateStudent({required Map<String, dynamic> map}) async {
    final apiResponse = await client.updateData(url: urlBase, map: map);

    if (apiResponse.statusCode != 200) {
      throw Exception('fail to update student');
    }
  }
}
