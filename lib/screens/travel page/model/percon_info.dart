import 'package:flutter/widgets.dart';

class Person {
  String? lastname;
  String? first_name;
  String? mothername;
  String? fathername;
  String? Box;

  String? age;
  String? mobleNumber;
  String? NationaID;
  Map<String, GlobalKey<FormState>> formKeys;

  // this.lastname,
  // this.Firsname,
  // this.mothername,
  // this.fathername,
  // this.Box,
  // this.age,
  // this.mobleNumber,
  // this.NationaID,

  Person({
    required this.formKeys,
    required this.lastname,
    required this.mothername,
    required this.Box,
    required this.NationaID,
    required this.age,
    required this.mobleNumber,
    required this.first_name,
    required this.fathername,
  });

  factory Person.fromJson(Map<String, dynamic> json, String id) {
    return Person(
      Box: json["Box"],
      age: json["age"].toString(),
      lastname: json["last_name"],
      first_name: json["first_name"],

      fathername: json["father_name"],
      mothername: json["mother_name"],
      // NationaID: json["NationaID"],
      mobleNumber: json["mobile_number"].toString(),
      formKeys: {
        'lastname': GlobalKey<FormState>(),
        'firstname': GlobalKey<FormState>(),
        'Box': GlobalKey<FormState>(),
        'mothername': GlobalKey<FormState>(),
        'fathername': GlobalKey<FormState>(),
        'age': GlobalKey<FormState>(),
        'mobileNumber': GlobalKey<FormState>(),
        'nationalID': GlobalKey<FormState>(),
      },
      NationaID: id,
    );
  }
}
