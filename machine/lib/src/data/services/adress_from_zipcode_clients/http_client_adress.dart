import 'package:http/http.dart' as http;
import 'package:learn_machine/src/interfaces/adress_from_zipcode/interface_http_client_adress_zipcode.dart';

class HttpClientAdress implements InterfaceHttpClientAddressZipcode {
  final client = http.Client();

  @override
  Future getData({required String url, required String cep}) async {
    return await client.get(Uri.parse('$url/$cep/json'));
  }
}
