import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/core/utils/FormState.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';
import 'package:travel_app1/screens/Auteh/modle/Auth.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Cous_TextField.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Icon_List_Bass.dart';
import 'package:travel_app1/screens/Auteh/view/widget/cusm_elevatedButton.dart';
import 'package:travel_app1/screens/Auteh/view/widget/icons_signup.dart';
import 'package:travel_app1/screens/Auteh/view/widget/welcom_Text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String phon = "";

  String pass = "";

  String email = "";
  GlobalKey<FormState> formtext2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AutehController a = Get.put(AutehController());
    bool value = false;
    return SingleChildScrollView(
      child: Stack(
        children: [
          const IconBass(),
          welcom_Text(
            text1: "3".tr,
            text2: "1".tr,
          ),
          Positioned(
            left: 32,
            top: 300,
            right: 32,
            child: Column(
              children: [
                Cous_TextField(
                    validator_text: (p0) {
                      if (p0!.isEmpty) return "ISEmpty";
                    },
                    formKey2: login_state1,
                    icon: icons_signup(
                      icon: Icons.person,
                    ),
                    text: "4".tr,
                    tex: (String v) {
                      email = v;
                    }),
                const SizedBox(
                  height: 15,
                ),
                Cous_TextField(
                    validator_text: (p0) {
                      if (p0!.isEmpty) return "ISEmpty";
                    },
                    formKey2: login_state2,
                    icon: icons_signup(
                      icon: Icons.lock,
                    ),
                    text: "5".tr,
                    tex: (String v) {
                      pass = v;
                    }),
                const SizedBox(
                  height: 15,
                ),
                Cous_TextField(
                    number: true,
                    validator_text: (p0) {
                      if (p0!.isEmpty) return "ISEmpty";
                    },
                    formKey2: login_state3,
                    icon: icons_signup(
                      icon: Icons.call,
                    ),
                    text: "6".tr,
                    tex: (String v) {
                      phon = v;
                    }),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/forgotPassword_View');
                      },
                      child: Text(
                        "8".tr,
                        style: TextStyle(
                          fontFamily: fontType,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 65,
                    ),
                    GetX<AutehController>(
                      builder: (controller) => Checkbox(
                        shape: OutlinedBorder.lerp(
                            const OvalBorder(), const OvalBorder(), 1),
                        value: controller.remindme.value,
                        onChanged: (bool? newValue) {
                          controller.remindme.value = newValue!;
                          sharedPreferences!
                              .setBool('remindme', controller.remindme.value);
                          print(sharedPreferences?.getBool('remindme'));
                        },
                      ),
                    ),
                    Text(
                      "7".tr,
                      style: TextStyle(fontFamily: fontType),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 98, left: 87),
                  child: cusm_elevatedButton(
                      width: 0,
                      color: const Color.fromARGB(255, 25, 53, 102),
                      text: "1".tr,
                      colortext: Colors.white,
                      onPrees: () async {
                        await Auth1.Login(email, pass);

                        // _valid();
                        // print(a.name.value);
                        a.ProfilUser(email, pass, phon);

                        // context.go('/create_Accont_veiw');
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _valid() {
  if (login_state1.currentState!.validate()) {
    print("valid");
  }
  if (login_state2.currentState!.validate()) {
    print("valid");
  }
  if (login_state3.currentState!.validate()) {
    print("valid");
  } else
    print("Not Valid");
  // await Auth1.signUp1(name!, pass!, phon!);
  // context.push('/HomeScreenView');
}
