import 'package:flutter/material.dart';

class icons_signup extends StatelessWidget {
  const icons_signup({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 25, 53, 102),
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
