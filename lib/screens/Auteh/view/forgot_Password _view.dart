import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/screens/Auteh/view/widget/forgotPassword_Body.dart';

class forgotPassword_View extends StatelessWidget {
  const forgotPassword_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("11".tr)),
      ),
      body: forgotPassword_body(),
    );
  }
}
