import 'package:flutter/material.dart';
import 'package:learn_machine/src/domain/models/adress_from_zipcode/zip_code_adress_model.dart';
import 'package:learn_machine/src/interfaces/adress_from_zipcode/interface_adress_zipcode_repository.dart';

class AddressFromZicodeController extends ChangeNotifier {
  final InterfaceAddressZipcodeRepository repository;
  String isError = '';
  bool isLoading = false;
  ZipCodeAddressModel state = ZipCodeAddressModel.empty();

  AddressFromZicodeController({required this.repository});

  Future<void> getAddress({required String cep}) async {
    isLoading = true;
    notifyListeners();

    try {
      state = await repository.getAdress(cep: cep);
    } catch (e) {
      isError = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
