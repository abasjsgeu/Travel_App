import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class Itime_Notif extends StatelessWidget {
  const Itime_Notif({super.key, required this.Imag, required this.text});
  final String Imag;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 325,
      // height: 128,
      alignment: const Alignment(1, 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 244, 243, 241),
        borderRadius: BorderRadius.circular(34),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Imag,
                scale: 1.4979,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.only(right: 12.0, top: 5),
                child: Text(
                  textAlign: TextAlign.right,
                  text.tr,
                  style: TextStyle(fontSize: 20, fontFamily: fontType),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
