import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Home%20screen/model/object_notif.dart';

class Mynotif extends GetxController {
  RxList<ObjectNotif> myObjectNotif = <ObjectNotif>[].obs;
  bool _isListenerSet = false; // متغير لتتبع حالة المستمع
  final RxInt itemCount = 10.obs;
  final RxBool isLoading = false.obs;
  RxInt notificationCount = 0.obs;

  RxBool myrec = false.obs;
  Future<void> recevNoiti() async {
    myObjectNotif.clear();
    final res = await supabase.from('notifications').select("head,body,image");
    print(res.length);
    // notificationCount.value = res.length;
    notificationCount.value++;

    print("____________________");
    for (int i = 0; i < res.length; i++) {
      final noiti = res[i];
      final mynoti = ObjectNotif.fromJson(noiti);
      print(res.length);

      myObjectNotif.add(mynoti);
    }
  }

  void resetnoiti() {
    notificationCount.value = 0;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    // lis();
    print("GOOMMMMMMMMMMMMMMMOO");
    final res = await supabase.from('notifications').select("head,body,image");
    await recevNoiti();

    notificationCount.value = res.length;

    super.onInit();
  }

  @override
  void onReady() {
    print("VVVVVVVVVVVVVVVV");
    // TODO: implement onReady
    super.onReady();
  }

  void lisen() {}
}
