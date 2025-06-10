import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';

class welcom_Text extends StatelessWidget {
  const welcom_Text({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 93),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 65),
              child: Text(
                text1,
                style: TextStyle(
                    fontFamily: fontType,
                    fontSize: 35,
                    color: const Color.fromARGB(239, 33, 90, 188)),
              ),
            ),
            Text(
              text2,
              style: TextStyle(
                  fontFamily: fontType,
                  fontSize: 20,
                  color: const Color.fromARGB(239, 33, 90, 188)),
            ),
          ],
        ),
      ),
    );
  }
}
