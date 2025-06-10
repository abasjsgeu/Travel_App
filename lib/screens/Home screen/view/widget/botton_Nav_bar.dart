import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:travel_app1/constants.dart';

class BottonNavBar extends StatefulWidget {
  const BottonNavBar({super.key});

  @override
  State<BottonNavBar> createState() => _BottonNavBarState();
}

class _BottonNavBarState extends State<BottonNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.only(bottom: 38.0),
      child: Align(
          alignment: AlignmentDirectional.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(134),
              color: colorblue,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 40,
                  color: Color.fromARGB(125, 0, 0, 0),
                )
              ],
            ),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GNav(
                  color: Colors.white,
                  padding: const EdgeInsets.all(15),
                  activeColor: const Color.fromARGB(255, 255, 254, 254),
                  tabs: [
                    GButton(
                      icon: Icons.person,
                      onPressed: () {
                        Get.toNamed('/EditProfileuserView');
                      },
                      iconSize: 20,
                      text: "81".tr,
                    ),
                    GButton(
                      icon: const IconData(0xe0f0, fontFamily: 'MaterialIcons'),
                      iconSize: 20,
                      text: "37".tr,
                      onPressed: () {
                        Get.toNamed('/ReservationView');
                      },
                    ),
                    GButton(
                      icon: Icons.home,
                      iconSize: 20,
                      text: "35".tr,
                      onPressed: () {
                        Get.toNamed('/HomeScreenView');
                      },
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
