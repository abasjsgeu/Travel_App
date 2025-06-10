import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/core/utils/assets.dart';

class Best_offers extends StatelessWidget {
  const Best_offers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 325,
      height: 128,
      alignment: const Alignment(1, 4),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 12), blurRadius: 23)
          ],
          // color: Colors.amber,
          borderRadius: BorderRadius.circular(34),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(51, 0, 0, 0), BlendMode.colorBurn),
              image: AssetImage(image10),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 48.0, right: 13),
                child: Text(
                  "33".tr,
                  style: TextStyle(
                      fontSize: 19, color: colorwhite, fontFamily: fontType),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "34".tr,
                  style: TextStyle(color: colorwhite, fontFamily: fontType),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
