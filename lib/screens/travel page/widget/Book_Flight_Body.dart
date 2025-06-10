import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';
import 'package:travel_app1/screens/travel%20page/widget/Contuner_INFOPERSON_TextFiled.dart';
import 'package:travel_app1/screens/travel%20page/widget/INFO_AND_ADD_PERSON.dart';
import 'package:travel_app1/screens/travel%20page/widget/Place_travel.dart';

class BookFlightBody extends StatelessWidget {
  const BookFlightBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Appbar2(
                f2: () {
                  Get.back();
                },
                f: () {},
                f3: () {
                  Get.toNamed('/PagenotifView');
                },
                icon_back: true,
                text: "47".tr,
              ),
              const SizedBox(
                height: 25,
              ),
              const Place_travel(),
              const SizedBox(
                height: 15,
              ),
              const INFO_AND_ADD_PERSON(),
              const SizedBox(
                height: 20,
              ),
              Contuner_INFOPERSON_TextFiled(
                data: null,
                s: false,
              )
            ],
          ),
        )
      ],
    );
  }
}
