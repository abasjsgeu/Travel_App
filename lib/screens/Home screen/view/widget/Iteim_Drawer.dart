import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';

class Iteim_Drawer extends StatelessWidget {
  const Iteim_Drawer({super.key, required this.icon_drwer, required this.text});
  final IconData icon_drwer;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(80, 171, 169, 164),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(icon_drwer),
            title: Text(
              text,
              style: TextStyle(fontFamily: fontType),
            ),
          ),
        ],
      ),
    );
  }
}
