import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/core/utils/FormState.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/modle/Auth.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Cous_TextField.dart';
import 'package:travel_app1/screens/Auteh/view/widget/cusm_elevatedButton.dart';

class forgotPassword_body extends StatefulWidget {
  const forgotPassword_body({super.key});

  @override
  State<forgotPassword_body> createState() => _forgotPassword_bodyState();
}

class _forgotPassword_bodyState extends State<forgotPassword_body> {
  String? email;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 190),
          child: Text("12".tr, style: TextStyle(fontFamily: fontType)),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 122, right: 28, left: 28),
          child: Cous_TextField(
            // number: true,
            formKey2: verificationcode_state,
            icon: null,
            validator_text: (p0) {
              if (p0!.isEmpty) return "isEmpty";
              return null;
            },
            text: "9".tr,
            tex: (String? v) {
              setState(() {
                email = v;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28, right: 28),
          child: cusm_elevatedButton(
            width: 0,
            color: const Color.fromARGB(255, 25, 53, 102),
            text: "10".tr,
            colortext: Colors.white,
            onPrees: () {
              // _vldait();
              Auth1.ResetPasswor(emai: email.toString());
            },
          ),
        )
      ],
    );
  }
}

void _vldait() {
  if (verificationcode_state.currentState!.validate()) {
    return print("");
  }
}
