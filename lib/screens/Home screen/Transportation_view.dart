import 'package:flutter/material.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Transportation_body.dart';

class TransportationView extends StatefulWidget {
  const TransportationView({super.key});

  @override
  State<TransportationView> createState() => _TransportationViewState();
}

class _TransportationViewState extends State<TransportationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      body: TransportationBody(),
    );
  }
}
