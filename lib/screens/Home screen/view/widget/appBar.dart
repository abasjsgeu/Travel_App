import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:travel_app1/main.dart';
import 'package:badges/badges.dart' as badges;
import 'package:travel_app1/screens/Home%20screen/controller/mynotif.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('ddddddddd');
  }

  // Mynotif n = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      color: const Color.fromARGB(253, 25, 53, 102),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: IconButton(
              iconSize: 40,
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ),
          const SizedBox(
            width: 120,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 30.0,
                right: sharedPreferences!.getString("lang") == "en" ? 2 : 50,
                left: 0),
            child: Row(
              children: [
                Text(
                  "20".tr,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                GetX<Mynotif>(
                  builder: (controller) => IconButton(
                    // tooltip:"",
                    icon: badges.Badge(
                      badgeContent: Text(
                        controller.notificationCount.value.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      child: const Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/PagenotifView');
                      controller.resetnoiti();
                      // يمكنك إضافة أي إجراء هنا (مثل الانتقال إلى صفحة الإشعارات)
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
