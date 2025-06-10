import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/screens/travel%20page/controller/add_person.dart';

class INFO_AND_ADD_PERSON extends StatelessWidget {
  const INFO_AND_ADD_PERSON({super.key});

  @override
  Widget build(BuildContext context) {
    PersonController _controller = Get.put(PersonController());

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                _controller.addPerson();
              },
              child: Row(
                children: [
                  const Icon(Icons.add),
                  Text(
                    "52".tr,
                    style: TextStyle(fontFamily: fontType),
                  ),
                ],
              )),
          Text(
            "52".tr,
            style: TextStyle(color: colorblue, fontFamily: fontType),
          ),
        ],
      ),
    );
  }
}
