import 'package:flutter/material.dart';
import 'package:machine/src/domain/models/student/address_model.dart';
import 'package:machine/src/domain/models/student/city_model.dart';
import 'package:machine/src/domain/models/student/courses_model.dart';
import 'package:machine/src/domain/models/student/phone_model.dart';
import 'package:machine/src/domain/models/student/student_model.dart';

class StudentFormController extends ChangeNotifier {
  String fullName = '';
  int age = 0;
  List<String> nameCourses = [];
  List<CoursesModel> courses = [CoursesModel.empty()];
  PhoneModel phone = PhoneModel.empty();
  CityModel city = CityModel.empty();
  String street = '';
  int streetNumber = 0;
  String zipCode = '';

  void updateStreet(String value) => street = value;

  void updateZipCode(String value) => zipCode = value;

  void updateStreetNumber(String value) => streetNumber = int.parse(value);

  void updateFullName(String value) => fullName = value;

  void updateAge(String value) {
    if(value.isNotEmpty){
      age = int.parse(value);
    }
  }

  void updateNameCourses({required String value, required bool delete}) {
    if (delete) {
      nameCourses.remove(value);
    }
    nameCourses.add(value);
  }

  void updateCoursesStudent({required List<Map<String, dynamic>> value}) {
    final listCoursesStudent =
        value.map<CoursesModel>((courseItem) {
          return CoursesModel(id: 1, name: 'teste', isStudent: false);
        }).toList();
    courses = listCoursesStudent;
  }

  void updatePhone({required int ddd, required String phoneNumber}) {
    phone = PhoneModel(ddd: ddd, phone: phoneNumber);
  }

  void updateCity({required int idCity, required String cityName}) {
    city = CityModel(id: idCity, name: cityName);
  }

  StudentModel createStudent() {
    return StudentModel(
      name: fullName,
      age: age,
      nameCourses: nameCourses,
      address: AddressModel(
        street: street,
        number: streetNumber,
        zipCode: zipCode,
        city: city,
        phone: phone,
      ),
      courses: courses,
    );
  }
}
