import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';

class Elevated_Button extends StatelessWidget {
  const Elevated_Button(
      {super.key,
      required this.onPrees,
      required this.text,
      required this.w,
      required this.h,
      required this.background,
      required this.colorText});
  final VoidCallback onPrees;
  final String text;
  final double w;
  final double h;
  final Color background;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: const BorderSide(
                color: Color.fromARGB(239, 33, 90, 188), width: 2),
            backgroundColor: background,
            textStyle: TextStyle(fontSize: 15, fontFamily: fontType),
            minimumSize: const Size.fromHeight(72),
            elevation: 0),
        onPressed: onPrees,
        child: Text(
          text,
          style: TextStyle(color: colorText, fontFamily: fontType),
        ),
      ),
    );
  }
}
