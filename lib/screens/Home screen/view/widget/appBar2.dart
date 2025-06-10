import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';

class Appbar2 extends StatelessWidget {
  const Appbar2(
      {super.key,
      required this.icon_back,
      required this.text,
      this.f,
      this.f2,
      this.f3});
  final bool icon_back;
  final VoidCallback? f;
  final VoidCallback? f2;
  final VoidCallback? f3;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      // key: UniqueKey(),
      width: MediaQuery.of(context).size.width,
      height: 230,
      color: const Color.fromARGB(253, 25, 53, 102),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon_back == true && key.toString() == "[<'ds'>]"
              ? IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: f,
                  icon: const Icon(Icons.arrow_back),
                )
              : IconButton(
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: f2,
                  icon: const Icon(Icons.arrow_back),
                ),
          const SizedBox(
            width: 40,
          ),
          Center(
            child: Text(text,
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: fontType)),
          ),
          SizedBox(
            width: 30,
          ),
          IconButton(
            iconSize: 30,
            color: Colors.white,
            onPressed: f3,
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
