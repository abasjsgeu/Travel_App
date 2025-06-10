import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app1/core/utils/FormState.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';
import 'package:travel_app1/screens/Auteh/modle/Auth.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Cous_TextField.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Icon_List_Bass.dart';
import 'package:travel_app1/screens/Auteh/view/widget/icons_signup.dart';
import 'package:travel_app1/screens/Auteh/view/widget/welcom_Text.dart';
import 'cusm_elevatedButton.dart';

class ResetpasswordBody extends StatefulWidget {
  const ResetpasswordBody({super.key});

  @override
  State<ResetpasswordBody> createState() => _ResetpasswordBodyState();
}

class _ResetpasswordBodyState extends State<ResetpasswordBody> {
  final AutehController cc = Get.put(AutehController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const IconBass(),
              welcom_Text(
                text1: "3".tr,
                text2: "11".tr,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Cous_TextField(
                    validator_text: (p0) {
                      if (p0!.isEmpty) return "IsEmpty";
                    },
                    tex: (p0) {
                      cc.new_pass.value = p0;
                    },
                    formKey2: ReserPassword_state2,
                    text: "5".tr,
                    icon: icons_signup(icon: Icons.lock),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Cous_TextField(
                      validator_text: (p0) {
                        if (p0!.isEmpty) return "isEmpty";
                      },
                      tex: (p0) {
                        cc.new_pass.value = p0;
                      },
                      formKey2: ReserPassword_state1,
                      text: "18".tr,
                      icon: icons_signup(icon: Icons.lock),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 126, right: 126, top: 120),
                    child: cusm_elevatedButton(
                      width: 0,
                      color: const Color.fromARGB(255, 25, 53, 102),
                      text: "19".tr,
                      colortext: Colors.white,
                      onPrees: () {
                        // تنفيذ عملية إعادة تعيين كلمة المرور
                        // print("dddddddddddd");

                        // Get.toNamed('/HomeScreenView');

                        Auth1.updatepassward(cc.new_pass.value, vldait);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void vldait() {
  if (ReserPassword_state1.currentState!.validate()) print("Isss");
  if (ReserPassword_state2.currentState!.validate()) print("OJ");
}
