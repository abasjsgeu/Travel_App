import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app1/firebase_options.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Home%20screen/controller/mynotif.dart';

class settingGetxServices extends GetxService {
  RxString name = "".obs;
  RxString pass = "".obs;
  RxString phon = "".obs;
  Future<settingGetxServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // print(sharedPreferences?.getString('name'));
    print(sharedPreferences?.getBool('remindme'));

    return this;
  }

  Future<void> initNotification() async {
    Mynotif n = Get.put(Mynotif(), permanent: true);
    // n.notificationCount.value = n.myObjectNotif.length;
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await n.recevNoiti();
      Get.toNamed('/PagenotifView');
      n.resetnoiti();
    });

    print("PPPPPPPPPPPP");
  }

  ProfilUser(String? name1, String? pass1, String? phon1) {
    name.value = name1!;
    pass.value = pass1!;
    phon.value = phon1!;
    sharedPreferences?.setString("name", name.value);
    sharedPreferences?.setString("pass", pass.value);
    sharedPreferences?.setString("phon", phon.value);
  }
}
