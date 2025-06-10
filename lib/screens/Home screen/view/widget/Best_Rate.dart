import 'package:flutter/material.dart';
import 'package:travel_app1/core/utils/assets.dart';

class Best_Rate extends StatelessWidget {
  const Best_Rate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
              height: 170.0, width: 155.0, fit: BoxFit.cover, image3),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
              height: 170.0, width: 155.0, fit: BoxFit.cover, image11),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
              height: 170.0, width: 155.0, fit: BoxFit.cover, image12),
        ),
      ],
    );
  }
}
