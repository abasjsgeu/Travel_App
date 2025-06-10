import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class Comanies extends StatefulWidget {
  const Comanies({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  State<Comanies> createState() => _ComaniesState();
}

class _ComaniesState extends State<Comanies> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        width: 380,
        height: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(97, 31, 7, 7), BlendMode.darken),
              image: AssetImage(
                widget.image,
              ),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 28.0, top: 23),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                    color: colorwhite, fontSize: 20, fontFamily: fontType),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "73".tr,
                style: TextStyle(
                    color: colorwhite, fontSize: 12, fontFamily: fontType),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "74".tr,
                style: TextStyle(
                    color: colorwhite, fontSize: 12, fontFamily: fontType),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "75".tr,
                style: TextStyle(
                    color: colorwhite, fontSize: 12, fontFamily: fontType),
              )
            ],
          ),
        ),
      ),
    );
  }
}
