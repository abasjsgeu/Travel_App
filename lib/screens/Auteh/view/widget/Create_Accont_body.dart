import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:travel_app1/core/utils/FormState.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/services.dart';
import 'package:travel_app1/screens/Auteh/modle/Auth.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Cous_TextField.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Icon_List_Bass.dart';
import 'package:travel_app1/screens/Auteh/view/widget/cusm_elevatedButton.dart';
import 'package:travel_app1/screens/Auteh/view/widget/icons_signup.dart';
import 'package:travel_app1/screens/Auteh/view/widget/welcom_Text.dart';
import 'package:travel_app1/services/settingGetxServices.dart';

class CreateAccont_body extends StatefulWidget {
  const CreateAccont_body({super.key});

  @override
  State<CreateAccont_body> createState() => _CreateAccont_bodyState();
}

class _CreateAccont_bodyState extends State<CreateAccont_body> {
  String name = "";

  String pass = "";
  String confPass = "";
  String phon = "";

  @override
  Widget build(BuildContext context) {
    AutehController c = Get.put(AutehController());
    bool value = false;
    return SingleChildScrollView(
      child: Stack(
        children: [
          const Directionality(
            textDirection: TextDirection.ltr,
            child: IconBass(),
          ),
          welcom_Text(
            text1: "3".tr,
            text2: "2".tr,
          ),
          Positioned(
            left: 32,
            top: 300,
            right: 32,
            child: Column(
              children: [
                Cous_TextField(
                  formKey2: formtext2,
                  validator_text: (p0) {
                    if (p0!.isEmpty) return "ISEmpty";
                  },
                  icon: const icons_signup(
                    icon: Icons.person,
                  ),
                  text: "4".tr,
                  tex: (String v) {
                    name = v!;
                    // sharedPreferences?.setString("name", c.name.value);

                    // sharedPreferences.setString(,  c.name.value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Cous_TextField(
                  formKey2: formtext3,
                  validator_text: (p0) {
                    if (p0!.isEmpty) return "ISEmpty";
                  },
                  icon: const icons_signup(
                    icon: Icons.lock,
                  ),
                  text: "5".tr,
                  tex: (String v) {
                    pass = v;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Cous_TextField(
                  validator_text: (p0) {
                    if (p0!.isEmpty) return "ISEmpty";
                  },
                  formKey2: formtext4,
                  icon: const icons_signup(
                    icon: Icons.lock,
                  ),
                  text: "18".tr,
                  tex: (String v) {
                    confPass = v;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Cous_TextField(
                  formKey2: formtext5,
                  validator_text: (p0) {
                    if (p0!.isEmpty) return "ISEmpty";
                  },
                  icon: const icons_signup(
                    icon: Icons.call,
                  ),
                  text: "6".tr,
                  tex: (String v) {
                    phon = v;
                  },
                  number: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GetX<AutehController>(
                      builder: (controller) => Checkbox(
                        shape: OutlinedBorder.lerp(
                            const OvalBorder(), const OvalBorder(), 1),
                        value: c.remindme.value,
                        onChanged: (bool? newValue) {
                          c.remindme.value = newValue!;
                          sharedPreferences!
                              .setBool("remindme", c.remindme.value);

                          print(c.remindme.value);
                        },
                      ),
                    ),
                    Text("7".tr),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 98, left: 87),
                  child: cusm_elevatedButton(
                    width: 0,
                    color: const Color.fromARGB(255, 25, 53, 102),
                    text: "2".tr,
                    colortext: const Color.fromARGB(255, 179, 169, 169),
                    onPrees: () {
                      // valid();

                      Auth1.signUp1(name, pass, phon, valid);

                      c.ProfilUser(name, pass, phon);

                      // await Auth1.Messaging_Segin();
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> valid() async {
  if (formtext2.currentState!.validate()) {
    print("valid");
  }
  if (formtext3.currentState!.validate()) {
    print("valid");
  }
  if (formtext4.currentState!.validate()) {
    print("valid");
  }
  if (formtext5.currentState!.validate()) {
    print("valid");
  } else
    print("Not Valid");
  // context.push('/HomeScreenView');
}

// Future signUp(
//   String email, String password, String firstName, String lastName) async {
// try {
//   // Step 1: Register the user using Supabase authentication
//   final response =
//       await supabase.auth.signUp(password: password, email: email);
//   if (response.user == null) {
//     print('Sign up NOT successful!');
//     throw "failed to sign up";
//   } ca {
//     print('Sign up successful!');
//   }}}
