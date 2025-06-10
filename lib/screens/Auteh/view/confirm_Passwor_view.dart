import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/screens/Auteh/view/widget/ConfirmPasswor_body.dart';

class ConfirmPassworView extends StatelessWidget {
  const ConfirmPassworView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("14".tr),
        ),
      ),
      body: ConfirmpassworBody(),
    );
  }
}
