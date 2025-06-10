import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class Container_Itime extends StatelessWidget {
  const Container_Itime({super.key, required this.ima});
  final String ima;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 109,
      // color: Colors.amber,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(width: 2, color: colorblue),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 130,
            top: 17,
            child: Padding(
              padding: const EdgeInsets.only(right: 6.0, left: 19),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  // color: Colors.black,
                  fit: BoxFit.cover,
                  ima,
                  height: 70.0,
                  width: 85.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 90,
            top: 20,
            child: Row(
              children: [
                Text(
                  "27".tr,
                  style: TextStyle(fontSize: 12, fontFamily: fontType),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 9),
                  child: Text(
                    "<-",
                    style: TextStyle(fontSize: 19, fontFamily: fontType),
                  ),
                ),
                Text(
                  "26".tr,
                  style: TextStyle(fontSize: 12, fontFamily: fontType),
                ),
              ],
            ),
          ),
          Positioned(
            left: 30,
            top: 50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Text(
                    "28".tr,
                    style: TextStyle(fontSize: 12, fontFamily: fontType),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 3.0, top: 9),
                  child: Text(
                    '43'.tr,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontFamily: fontType),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
