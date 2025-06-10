import 'package:flutter/material.dart';
import 'package:travel_app1/screens/Reservations/view/widget/reservation_body.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(248, 243, 238, 238),
      body: ReservationBody(),
    );
  }
}
