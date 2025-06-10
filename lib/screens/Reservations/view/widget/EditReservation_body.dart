import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';
import 'package:travel_app1/screens/travel%20page/model/percon_info.dart';
import 'package:travel_app1/screens/travel%20page/widget/Contuner_INFOPERSON_TextFiled.dart';

class EditreservationBody extends StatefulWidget {
  EditreservationBody({
    super.key,
  });
  final Person person1 = Get.arguments;

  @override
  State<EditreservationBody> createState() => _EditreservationBodyState();
}

class _EditreservationBodyState extends State<EditreservationBody> {
  @override
  void initState() {
    print(widget.person1.age);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Appbar2(
                icon_back: true,
                text: "80".tr,
                f2: () {
                  Get.back();
                },
                f3: () {
                  Get.toNamed('/PagenotifView');
                },
                f: () {},
              ),
              Contuner_INFOPERSON_TextFiled(
                data: widget.person1,
                s: true,
              )
            ],
          ),
        )
      ],
    );
  }
}
