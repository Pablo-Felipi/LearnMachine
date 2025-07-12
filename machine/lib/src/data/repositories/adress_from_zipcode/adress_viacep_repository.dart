import 'package:machine/src/domain/models/adress_from_zipcode/zip_code_adress_model.dart';
import 'package:machine/src/interfaces/adress_from_zipcode/interface_adress_zipcode_repository.dart';
import 'package:machine/src/interfaces/adress_from_zipcode/interface_http_client_adress_zipcode.dart';

class AdressViacepRepository implements InterfaceAddressZipcodeRepository {
  final InterfaceHttpClientAddressZipcode client;
  final String urlAdress;

  AdressViacepRepository({required this.client, required this.urlAdress});

  @override
  Future<ZipCodeAddressModel> getAdress({required String cep}) async {
    final apiResponse = await client.getData(url: urlAdress, cep: cep);

    if (apiResponse.statusCode != 200) {
      throw Exception('fail to connect Adress API');
    }

    final adress = ZipCodeAddressModel.fromJson(json: apiResponse.body);

    return adress;
  }
}
