import 'dart:convert';
import 'package:machine/src/domain/models/active_courses/active_courses_model.dart';
import 'package:machine/src/interfaces/active_courses/interface_active_courses_http_client.dart';
import 'package:machine/src/interfaces/active_courses/interface_active_courses_repository.dart';

class ActiveCoursesHttpRepository implements InterfaceActiveCoursesRepository {
  final InterfaceActiveCoursesHttpClient client;
  final String baseUrl;

  ActiveCoursesHttpRepository({required this.client, required this.baseUrl});

  @override
  Future<List<ActiveCoursesModel>> getCourses() async {
    final apiResponse = await client.getData(url: baseUrl);
    final List<ActiveCoursesModel> coursesList = [];

    if (apiResponse.statusCode != 200) {
      throw Exception('Error to connect');
    }

    final body = jsonDecode(apiResponse.body);

    for (var course in body) {
      final newCourse = ActiveCoursesModel.fromMap(map: course);
      coursesList.add(newCourse);
    }
    return coursesList;
  }
}
