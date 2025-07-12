import 'dart:convert';

class PhoneModel {
  final int ddd;
  final String phone;

  PhoneModel({required this.ddd, required this.phone});

  Map<String, dynamic> toMap() {
    return {'ddd': ddd, 'phone': phone};
  }

  String toJson() => jsonEncode(toMap());

  factory PhoneModel.fromMap({required Map<String, dynamic> map}) {
    return PhoneModel(ddd: map['ddd'] ?? 0, phone: map['phone'] ?? '');
  }

  factory PhoneModel.fromJson({required String json}) =>
      PhoneModel.fromMap(map: jsonDecode(json));

  factory PhoneModel.empty() {
    return PhoneModel(ddd: 0, phone: '');
  }
}
