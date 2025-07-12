import 'package:flutter/material.dart';
import 'package:machine/src/domain/models/student/student_model.dart';
import 'package:machine/src/interfaces/student/interface_student_repository.dart';


class StudentsController extends ChangeNotifier {
  final InterfaceStudentRepository repository;
  String isError = '';
  bool isLoading = false;
  List<StudentModel> state = <StudentModel>[];

  StudentsController({required this.repository});

  Future<void> get() async {
    isLoading = true;
    notifyListeners();

    try {
      state = await repository.getStudent();
      notifyListeners();
    } catch (e) {
      isError = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> update({required StudentModel student}) async {
    isLoading = true;
    notifyListeners();

    try {
      await repository.updateStudent(map: student.toMap());
      state = await repository.getStudent();
    } catch (e) {
      isError = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> create({required StudentModel student}) async {
    isLoading = true;
    notifyListeners();

    try {
      await repository.createStudent(map: student.toMap());
      state = await repository.getStudent();
    } catch (e) {
      isError = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> delete({required int id}) async {
    isLoading = true;
    notifyListeners();

    try {
      await repository.deleteStudent(id: id);
      state = await repository.getStudent();
    } catch (e) {
      isError = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
