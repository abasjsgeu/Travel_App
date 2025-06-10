import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(35.0),
            bottomRight: Radius.circular(25.0),
            topLeft: Radius.zero),
        color: colorwhite,
        border: Border.all(width: 2, color: colorblue),
      ),
      child: Center(
        child: Text(
          "66".tr,
          style:
              TextStyle(color: colorblue, fontSize: 12, fontFamily: fontType),
        ),
      ),
      // child: ClipRRect(

      // )),
    );
  }
}
