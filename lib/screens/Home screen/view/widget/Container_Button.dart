import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/screens/Home%20screen/controller/mynotif.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/BoxDrop_Button.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/Date_Time.dart';
import 'package:http/http.dart' as http;

class ContainerButton extends StatefulWidget {
  const ContainerButton({super.key});

  @override
  State<ContainerButton> createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  // Mynotif con = Get.put(Mynotif());
  @override
  Widget build(BuildContext context) {
    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.only(bottom: 40),
      child: Center(
        child: Container(
          width: 284,
          height: 297,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 245, 242, 242),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 3), blurRadius: 23)
            ],
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 19.0),
                child: BoxDrop_Button(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: BoxDrop_Button(),
              ),
              Padding(
                key: UniqueKey(),
                padding: const EdgeInsets.only(top: 10),
                child: Date_Time(
                  key: UniqueKey(),
                  calendar: true,
                  ic: Icon(
                    key: UniqueKey(),
                    Icons.date_range,
                    color: colorblue,
                  ),
                  text: '23'.tr,
                  onPress: () {
                    showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2025));
                  },
                ),
              ),
              Padding(
                  key: UniqueKey(),
                  padding: const EdgeInsets.only(top: 10),
                  child: Date_Time(
                    calendar: false,
                    ic: Icon(
                      color: colorblue,
                      const IconData(0xe1d5, fontFamily: 'MaterialIcons'),
                    ),
                    text: "25".tr,
                    onPress: () {
                      Get.toNamed('/TransportationView');
                    },
                  )),
              TextButton(
                onPressed: () async {
                  // final User? user = supabase.auth.currentUser;

                  Get.toNamed('/TravelPageView');
                },
                child: Container(
                  color: colorblue,
                  width: 245,
                  height: 30,
                  child: Center(
                    child: Text(
                      "25".tr,
                      style: TextStyle(color: colorwhite, fontFamily: fontType),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _triggerNotification() async {
  final response = await http.post(
    Uri.parse(
        'https://ictrjvtqluagfksjsrcr.supabase.co/functions/v1/order-configuration'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'user_id': 'current-user-id'}),
  );

  if (response.statusCode != 200) {
    print('فشل إرسال الإشعار: ${response.body}');
  }
}
