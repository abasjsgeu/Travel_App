import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app1/screens/Home%20screen/controller/mynotif.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Best_offers.dart';

class Listview_Bestoffers extends StatefulWidget {
  Listview_Bestoffers({super.key, required this.controller});
  final ScrollController controller;

  @override
  State<Listview_Bestoffers> createState() => _Listview_BestoffersState();
}

class _Listview_BestoffersState extends State<Listview_Bestoffers> {
  Mynotif n = Get.find();

  var itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.controller,
      physics: const AlwaysScrollableScrollPhysics(), // 5. تفعيل التمرير
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: itemCount + 1, // 6. استخدام متغير الحالة
      itemBuilder: (BuildContext context, int index) {
        if (index < itemCount) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Best_offers(), // 7. يجب أن يكون كونست
          );
        }
        return const Padding(
          padding: EdgeInsets.all(23),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
