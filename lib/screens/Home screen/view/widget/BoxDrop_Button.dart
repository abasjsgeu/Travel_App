import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';

class BoxDrop_Button extends StatefulWidget {
  const BoxDrop_Button({super.key});

  @override
  State<BoxDrop_Button> createState() => _BoxDrop_Button();
}

class _BoxDrop_Button extends State<BoxDrop_Button> {
  @override
  Widget build(BuildContext context) {
    String? drop;
    var items = ["Anas", "Anas", "Anas", "Anas", "Anas"];

    return Container(
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: const Color.fromARGB(255, 236, 240, 243),
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
        icon: Row(
          children: [
            const SizedBox(
              width: 8,
            ),
            Opacity(
                opacity: .3,
                child: Text("21".tr, style: TextStyle(fontFamily: fontType))),
            const SizedBox(
              width: 14,
            ),
            Icon(const IconData(0xe1d5, fontFamily: 'MaterialIcons'),
                color: colorblue),
            const Icon(Icons.person_2_outlined,
                color: Color.fromARGB(255, 25, 53, 102)),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
