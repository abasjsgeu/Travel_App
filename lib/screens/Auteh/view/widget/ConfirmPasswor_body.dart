import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';
import 'package:travel_app1/screens/Auteh/modle/Auth.dart';
import 'package:travel_app1/screens/Auteh/view/widget/cusm_elevatedButton.dart';

class ConfirmpassworBody extends StatefulWidget {
  const ConfirmpassworBody({super.key});
  @override
  State<ConfirmpassworBody> createState() => _ConfirmpassworBodyState();
}

class _ConfirmpassworBodyState extends State<ConfirmpassworBody> {
  AutehController ccc = Get.put(AutehController());

  @override
  void initState() {
    // TODO: implement initState
    ccc.startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AutehController c = Get.put(AutehController());

    return ListView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 140, bottom: 37, top: 111),
          child: Text(
            "15".tr,
            style: TextStyle(fontFamily: fontType),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: PinCodeTextField(
            onChanged: (String v) {
              c.Tocen.value = v;
            },
            appContext: context,
            length: 6,
            pinTheme: PinTheme(
                borderWidth: 44,
                borderRadius: BorderRadius.circular(23),
                shape: PinCodeFieldShape.box,
                fieldHeight: 70,
                fieldWidth: 50,
                inactiveColor: Colors.grey),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                await Auth1.ResetPasswor(
                    emai: sharedPreferences!.getString('another_email')!);
                ccc.resetTimer();
              },
              child: Text(
                "17".tr,
                style: TextStyle(fontFamily: fontType),
              ),
            ),
            GetX<AutehController>(
                builder: (controller) => Text(
                      "${ccc.remainingTime.value}",
                      style: TextStyle(fontFamily: fontType),
                    )),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text("16".tr, style: TextStyle(fontFamily: fontType)),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 28, right: 28),
          child: cusm_elevatedButton(
            width: 0,
            color: Color.fromARGB(255, 25, 53, 102),
            text: "10".tr,
            colortext: Colors.white,
            onPrees: () {
              String v = c.Tocen.value;
              // print(v);

              Auth1.chack(v);
            },
          ),
        )
      ],
    );
  }
}
