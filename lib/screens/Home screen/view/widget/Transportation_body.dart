import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/core/utils/assets.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Comanies.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';

class TransportationBody extends StatefulWidget {
  const TransportationBody({super.key});

  @override
  State<TransportationBody> createState() => _TransportationBodyState();
}

class _TransportationBodyState extends State<TransportationBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Appbar2(
                icon_back: true,
                text: "36".tr,
                f2: () {
                  Get.back();
                },
                f3: () {
                  Get.toNamed('/PagenotifView');
                },
                f: () {},
              ),
              Comanies(
                image: image6,
                text: "28".tr,
              ),
              Comanies(
                image: image7,
                text: "30".tr,
              ),
              Comanies(
                image: image8,
                text: "71".tr,
              ),
              Comanies(
                image: image9,
                text: "72".tr,
              )
            ],
          ),
        )
      ],
    );
  }
}
