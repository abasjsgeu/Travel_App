import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_app1/main.dart';

class LangugesController extends GetxController {
  RxString selectedLanguage = "EN".obs;
  RxString selectedLanguage1 = "AR".obs;

  Locale intialLang = sharedPreferences!.getString("lang") == null
      ? Get.deviceLocale!
      : Locale(sharedPreferences!.getString("lang")!);
  RxBool bool_button = true.obs;

  ///
  void changLangues(String l) {
    Locale locale = Locale(l);
    sharedPreferences!.setString("lang", l);
    Get.updateLocale(locale);
  }

  void changLangues1(String l) {
    Locale locale = Locale(l);
    sharedPreferences!.setString("lang", l);
    Get.updateLocale(locale);
  }

  void updateLanguage(String lang) {
    selectedLanguage.value = lang;
  }

  void updateButton(bool bool_buttn) {
    bool_button.value = bool_buttn;
  }
}
