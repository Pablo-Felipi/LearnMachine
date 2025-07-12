import 'dart:convert';

import 'package:learn_machine/src/domain/models/student/city_model.dart';
import 'package:learn_machine/src/domain/models/student/phone_model.dart';

class AddressModel {
  final String street;
  final int number;
  final String zipCode;
  final CityModel city;
  final PhoneModel phone;

  AddressModel({
    required this.street,
    required this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory AddressModel.fromMap({required Map<String, dynamic> map}) {
    return AddressModel(
      street: map['street'] ?? '',
      number: map['number'] ?? 0,
      zipCode: map['zipCode'] ?? '',
      city: CityModel.fromMap(map: map['city'] ?? CityModel.empty()),
      phone: PhoneModel.fromMap(map: map['phone'] ?? PhoneModel.empty()),
    );
  }

  factory AddressModel.fromJson({required String json}) =>
      AddressModel.fromMap(map: jsonDecode(json));

  factory AddressModel.empty() {
    return AddressModel(
      street: '',
      number: 0,
      zipCode: '',
      city: CityModel.empty(),
      phone: PhoneModel.empty(),
    );
  }
}
