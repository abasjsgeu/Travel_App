import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';

class Authmiddleware extends GetMiddleware {
  AutehController c = Get.put(AutehController());

  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences?.getString('name') != null &&
        sharedPreferences?.getBool('remindme') == true)
      return RouteSettings(name: '/HomeScreenView');
    return null;
  }
}
