import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class number_Person extends StatefulWidget {
  const number_Person({super.key});

  @override
  State<number_Person> createState() => _number_PersonState();
}

class _number_PersonState extends State<number_Person> {
  var items = ["1", "2", "3", "4", "5"];

  @override
  Widget build(BuildContext context) {
    String? drop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "64".tr,
          style: TextStyle(fontFamily: fontType),
        ),
        Container(
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: colorwhite,
            ),
            child: DropdownButtonFormField<String>(
              hint: const Icon(Icons.arrow_drop_down),
              items: items
                  .map(
                    (toElement) => DropdownMenuItem(
                      value: toElement,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Text(
                          style: TextStyle(fontFamily: fontType),
                          toElement,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (toElement) => setState(() => drop = toElement),
              iconDisabledColor: colorblue,
              iconEnabledColor: colorblue,
            )),
      ],
    );
  }
}
