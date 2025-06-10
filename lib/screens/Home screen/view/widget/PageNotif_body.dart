import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app1/core/utils/assets.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';
import 'package:travel_app1/screens/Home%20screen/controller/mynotif.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Itime_Notif.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';
import 'package:badges/badges.dart' as badges;
import 'package:travel_app1/screens/travel%20page/model/percon_info.dart';

class PageNotif_body extends StatefulWidget {
  PageNotif_body({super.key});

  @override
  State<PageNotif_body> createState() => _PageNotif_bodyState();
}

class _PageNotif_bodyState extends State<PageNotif_body> {
  @override
  void initState() {
    print("object");
    Mynotif n = Get.find();
    // n.myObjectNotif.clear();
    print(n.notificationCount.value);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            Appbar2(
              key: Key('ds'),
              icon_back: true,
              text: "100".tr,
              f: () {
                Get.back();
              },
              f2: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      SliverToBoxAdapter(
        child: List_Notif(),
      )
    ]);
  }
}

class List_Notif extends StatelessWidget {
  const List_Notif({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<Mynotif>(
      builder: (controller) => Column(
        children: [
          ...List.generate(
            controller.myObjectNotif.length,
            (index) {
              controller.myObjectNotif.length;

              final prs = controller.myObjectNotif[index];
              return Itime_Notif(
                Imag: image2,
                text: prs.body,
              );
            },
          ),
        ],
      ),
    );
  }
}

// Stack(
//         children: [
//           Column(
//             // mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 68.0),
//                 child: Text(
//                   "عروض 50% لطلاب الجامعات",
//                   style: TextStyle(fontSize: 20, color: colorwhite),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: Text(
//                   "      تعلن شركة زريق للسفريات عن حسم لجميع الطلاب المسافرين",
//                   style: TextStyle(color: colorwhite),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 198.0),
//                 child: Text(
//                   " من دمشق الى اللاذقية ",
//                   style: TextStyle(color: colorwhite),
//                 ),
//               )
//             ],
//           ),
//           Positioned(
//               left: 50,
//               child: Image.asset(
//                 image2,
//                 scale: 1.7979,
//               ))
//         ],
//       ),
