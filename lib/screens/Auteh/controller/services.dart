import 'dart:async';

import 'package:get/get.dart';
import 'package:travel_app1/main.dart';

class AutehController extends GetxController {
  RxBool remindme = true.obs;
  // RxBool respon = false.obs;
  RxString name = "".obs;
  RxString pass = "".obs;
  RxString phon = "".obs;
  RxString another_email = "".obs;
  RxString Tocen = ''.obs;
  RxInt start = 30.obs;
  RxString new_pass = "".obs;

  ProfilUser(String? name1, String? pass1, String? phon1) {
    name.value = name1!;
    pass.value = pass1!;
    phon.value = phon1!;
    sharedPreferences?.setString("name", name.value);
    sharedPreferences?.setString("pass", pass.value);
    sharedPreferences?.setString("phon", phon.value);
  }

  var remainingTime = 30.obs; // العداد يبدأ من 30 ثانية
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (remainingTime.value == 0) {
        timer.cancel();
      } else {
        remainingTime.value--;
      }
    });
  }

  void resetTimer() {
    remainingTime.value = 30; // إعادة تعيين العداد إلى 30 ثانية
    timer?.cancel();
    startTimer();
  }
}
