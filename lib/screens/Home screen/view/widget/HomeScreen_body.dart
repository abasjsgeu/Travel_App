import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/modle/Auth.dart';
import 'package:travel_app1/screens/Home%20screen/controller/mynotif.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Best_offers.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Container_Button.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/ListViw_trips.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Listview_BestRate.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Listview_Bestoffers.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/botton_Nav_bar.dart';

class HomescreenBody extends StatefulWidget {
  const HomescreenBody({super.key});

  @override
  State<HomescreenBody> createState() => _HomescreenBodyState();
}

class _HomescreenBodyState extends State<HomescreenBody> {
  @override
  Mynotif n = Get.find();

  final ScrollController controller = ScrollController();
  int _itemCount = 10;
  bool _isLoading = false;
  int itemCount = 10;

  void _onScroll() {
    print(controller.offset);
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      _fetch();
    }
  }

  Future<void> _fetch() async {
    // 3. محاكاة جلب بيانات من الخادم
    print("call");
    await Future.delayed(const Duration(seconds: 3));
    n.itemCount.value += 10;
  }

  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      n.myrec.value = true;
      _showNotification(message, context);
    });

    if (n.myrec.value == true) {
      n.recevNoiti();
      n.myrec.value = false;
    }
    if (sharedPreferences!.getBool('back_mynotifi') == true) {
      n.recevNoiti();
      sharedPreferences!.setBool('back_mynotifi', false);
    }
    controller.addListener(_onScroll);

    // TODO: implement initState
    super.initState();

    // Auth1.getuser();
    sharedPreferences!.setString(
        "lang",
        sharedPreferences!.getString("lang") == null
            ? Get.deviceLocale!.languageCode
            : sharedPreferences!.getString("lang")!);
    Auth1.setupAuthListener();
    print(sharedPreferences?.getString('name'));
  }

  @override
  void dispose() {
    n.itemCount.value = 10;
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var wi = MediaQuery.of(context).size.width;
    // var h = MediaQuery.of(context).size.height;

    return RefreshIndicator(
      onRefresh: () async {
        await n.recevNoiti();
        n.notificationCount.value = n.myObjectNotif.length;
      },
      child: Stack(
        children: [
          CustomScrollView(
            controller: controller,
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Appbar(),
                    const Padding(
                      padding: EdgeInsets.only(top: 101.0),
                      child: ContainerButton(),
                    ),
                    Positioned(
                      top: 410,
                      left: 300,
                      right: 22,
                      child: Text(
                        "c".tr,
                        style:
                            TextStyle(color: colorblue, fontFamily: fontType),
                      ),
                    ),
                  ],
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 123, width: 23, child: ListviwTrips()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 328.0, top: 13, bottom: 13),
                  child: Text(
                    "31".tr,
                    style: TextStyle(color: colorblue, fontFamily: fontType),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 134, child: Listview_BestRate()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 328.0, top: 23),
                  child: Text(
                    "32".tr,
                    style: TextStyle(color: colorblue, fontFamily: fontType),
                  ),
                ),
              ),
              GetX<Mynotif>(
                builder: (controller) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index < controller.itemCount.value) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Best_offers(),
                        );
                      }
                      return const Padding(
                        padding: EdgeInsets.all(23),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                    childCount: controller.itemCount.value + 1,
                  ),
                ),
              )
            ],
          ),
          const BottonNavBar()
        ],
      ),
    );
  }
}

void _showNotification(RemoteMessage message, BuildContext context) {
  Get.snackbar(
    "welcom ${message.notification!.body} ! ",
    '',
    icon: Icon(
      Icons.close,
      color: colorwhite,
    ),
    duration: Duration(seconds: 3),
    backgroundColor: colorwhite,
    colorText: colorblue,
  );
}
