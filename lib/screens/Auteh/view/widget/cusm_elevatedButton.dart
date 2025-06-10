import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';

class cusm_elevatedButton extends StatelessWidget {
  const cusm_elevatedButton(
      {super.key,
      required this.width,
      required this.color,
      required this.text,
      required this.colortext,
      this.onPrees});
  final double width;
  final Color color;
  final String text;
  final Color colortext;
  final VoidCallback? onPrees;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side:
              BorderSide(color: Color.fromARGB(239, 33, 90, 188), width: width),
          backgroundColor: color,
          textStyle: TextStyle(fontSize: 24, fontFamily: fontType),
          minimumSize: const Size.fromHeight(72),
          elevation: 0),
      onPressed: onPrees,
      child: Text(
        text,
        style: TextStyle(color: colortext, fontFamily: fontType),
      ),
    );
  }
}
