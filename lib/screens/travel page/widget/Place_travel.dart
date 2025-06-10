import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class Place_travel extends StatelessWidget {
  const Place_travel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 293,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          const BoxShadow(
              color: Colors.black26, offset: Offset(0, 10), blurRadius: 20),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 58.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${"48".tr} : ${"49".tr}",
              style: TextStyle(color: colorblue, fontFamily: fontType),
            ),
            Text("${"50".tr}   :${"49".tr}",
                style: TextStyle(color: colorblue, fontFamily: fontType))
          ],
        ),
      ),
    );
  }
}
