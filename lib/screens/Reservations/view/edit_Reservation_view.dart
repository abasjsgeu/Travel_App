import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app1/screens/Reservations/view/widget/EditReservation_body.dart';
import 'package:travel_app1/screens/travel%20page/model/percon_info.dart';

class EditReservationView extends StatelessWidget {
  EditReservationView({super.key});
  // final person = Get.arguments as Person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditreservationBody(),
    );
  }
}
