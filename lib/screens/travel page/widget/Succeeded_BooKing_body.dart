import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';
import 'package:travel_app1/screens/travel%20page/controller/add_person.dart';
import 'package:travel_app1/screens/travel%20page/widget/Elevated_Button.dart';

class SucceededBookingBody extends StatelessWidget {
  SucceededBookingBody({super.key});
  final PersonController controller = Get.find<PersonController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Appbar2(
          icon_back: true,
          text: "67".tr,
          f2: () {
            Get.back();
          },
          f3: () {
            Get.toNamed('/PagenotifView');
          },
          f: () {},
        ),
        SizedBox(
          height: 90,
        ),
        Center(
          child: Icon(
            Icons.check_circle,
            size: 90,
            color: colorblue,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "68".tr,
          style:
              TextStyle(color: colorblue, fontSize: 20, fontFamily: fontType),
        ),
        const SizedBox(
          height: 270,
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Elevated_Button(
                onPrees: () {
                  Get.toNamed("ReservationView");
                },
                text: "70".tr,
                w: 190,
                h: 60,
                background: colorwhite,
                colorText: colorblue,
              ),
              Elevated_Button(
                onPrees: () {
                  controller.Initialized.value = true;

                  Get.offAllNamed("/HomeScreenView");
                },
                text: "69".tr,
                w: 190,
                h: 60,
                background: colorblue,
                colorText: colorwhite,
              ),
            ],
          ),
        )
      ],
    );
  }
}
