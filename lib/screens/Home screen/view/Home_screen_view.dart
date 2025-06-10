import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/HomeScreen_body.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Iteim_Drawer.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      drawer: Padding(
        padding: const EdgeInsets.only(bottom: 292.0, top: 56),
        child: Drawer(
          width: 223,
          child: _item_drawer(context),
        ),
      ),
      body: const HomescreenBody(),
    );
  }

  Column _item_drawer(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            Get.toNamed('/TransportationView');
          },
          child: Iteim_Drawer(
            icon_drwer: const IconData(
              0xe1d5,
              fontFamily: 'MaterialIcons',
            ),
            text: "36".tr,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            Get.toNamed('/ReservationView');

            print("ggggggg");
          },
          child: Iteim_Drawer(
            icon_drwer: Icons.airplane_ticket,
            text: '37'.tr,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Iteim_Drawer(
          icon_drwer: Icons.search,
          text: '38'.tr,
        ),
        const SizedBox(
          height: 12,
        ),
        Iteim_Drawer(
          icon_drwer: Icons.local_offer,
          text: '39'.tr,
        ),
        const SizedBox(
          height: 12,
        ),
        Iteim_Drawer(
          icon_drwer: Icons.question_mark_outlined,
          text: '38'.tr,
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            sharedPreferences!.clear();
            Get.back();

            supabase.auth.signOut();
            Get.offAllNamed("/");
          },
          child: Iteim_Drawer(
            icon_drwer: Icons.logout_outlined,
            text: '41'.tr,
          ),
        ),
      ],
    );
  }
}
