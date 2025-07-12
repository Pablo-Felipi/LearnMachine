import 'package:machine/src/interfaces/active_courses/interface_active_courses_http_client.dart';
import 'package:http/http.dart' as http;

class ActiveCoursesHttpClient implements InterfaceActiveCoursesHttpClient {
  final client = http.Client();

  @override
  Future getData({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}
