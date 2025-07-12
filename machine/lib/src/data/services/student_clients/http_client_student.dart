import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:machine/src/interfaces/student/interface_http_client_student.dart';

class HttpClientStudent implements InterfaceHttpClientStudent {
  final client = http.Client();

  @override
  Future getData({required String url}) async {
    return await client.get(Uri.parse(url));
  }

  @override
  Future createData({
    required String url,
    required Map<String, dynamic> map,
  }) async {
    return client.post(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(map),
    );
  }

  @override
  Future deleteData({required String url, required int id}) async {
    return await client.delete(Uri.parse('$url/$id'));
  }

  @override
  Future updateData({
    required String url,
    required Map<String, dynamic> map,
  }) async {
    return client.put(
      Uri.parse(url),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(map),
    );
  }
}
