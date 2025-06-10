import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/core/utils/FormState.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/languges_Controller.dart';
import 'package:travel_app1/screens/Home%20screen/view/widget/appBar2.dart';
import 'package:travel_app1/services/settingGetxServices.dart';

class EditprofileuserBody extends StatelessWidget {
  const EditprofileuserBody({super.key});

  @override
  Widget build(BuildContext context) {
    settingGetxServices c2 = Get.put(settingGetxServices());
    LangugesController langugesController = Get.find();

    return SingleChildScrollView(
      child: Column(
        children: [
          Appbar2(
            icon_back: false,
            text: "81".tr,
            f2: () {
              Get.back();
            },
            f3: () {
              Get.toNamed('/PagenotifView');
            },
            f: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          GetX<settingGetxServices>(
            builder: (controller) => Edit_TextFild(
              number_fild: false,
              key: Key("anas1"),
              obscure_Text: false,
              showdialog: false,
              hinttext: sharedPreferences!.getString('name'),
              icon1: Icons.person_outline_outlined,
              text: c2.name.value,
            ),
          ),
          GetX<settingGetxServices>(
            builder: (controller1) => Edit_TextFild(
              number_fild: true,
              key: Key("anas2"),
              hinttext: sharedPreferences!.getString('phon'),
              showdialog: false,
              obscure_Text: false,
              icon1: Icons.phone_outlined,
              text: c2.phon.value,
            ),
          ),
          const Edit_TextFild(
            obscure_Text: true,
            number_fild: false,
            key: Key("anas3"),
            showdialog: false,
            icon1: Icons.lock_outlined,
            text: '******',
          ),
          Edit_TextFild(
            obscure_Text: false,
            number_fild: false,
            icon1: Icons.logout,
            text: '41'.tr,
            showdialog: true,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button_Seave_cansel(
                key: Key('end'),
                colorbutton: colorwhite,
                textbutton: '83'.tr,
                colortext: colorblue,
                width: 2,
              ),
              const SizedBox(
                width: 100,
              ),
              button_Seave_cansel(
                key: Key('seave'),
                width: 0,
                colorbutton: colorblue,
                textbutton: '82'.tr,
                colortext: colorwhite,
              )
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: colorblue),
              onPressed: () {
                _chang_languges(langugesController);
              },
              child: GetX<LangugesController>(
                  builder: (controller) => Text(
                        langugesController.selectedLanguage!.value,
                        style: TextStyle(color: colorwhite),
                      ))),
        ],
      ),
    );
  }
}

void _chang_languges(LangugesController langugesController) {
  if (langugesController.bool_button!.value == true) {
    langugesController.updateButton(false);
    langugesController.updateLanguage("EN");
    langugesController.changLangues("en");
    print(langugesController.bool_button!.value);
  } else if (langugesController.bool_button!.value == false) {
    langugesController.updateButton(true);

    langugesController.updateLanguage("AR");
    print(langugesController.bool_button!.value);

    langugesController.changLangues("ar");
  }
}

class Edit_TextFild extends StatelessWidget {
  const Edit_TextFild(
      {super.key,
      required this.text,
      required this.icon1,
      required this.showdialog,
      this.hinttext,
      required this.number_fild,
      required this.obscure_Text});
  final String? text;
  final IconData icon1;
  final bool showdialog;
  final String? hinttext;
  final bool number_fild;

  final bool obscure_Text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (showdialog == false) {
          _showDialog(context, hinttext, number_fild, obscure_Text);
        } else {
          sharedPreferences!.clear();
          supabase.auth.signOut();

          Get.offAllNamed('/');
        }
      },
      child: ListTile(
        trailing: const Icon(Icons.edit),
        shape: Border.all(color: const Color.fromARGB(48, 0, 0, 0), width: 1),
        title: Text(text!),
        selectedColor: Colors.amber,
        leading: Icon(
          icon1,
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String? testhint, bool number_fild,
      bool obscure_Text) {
    settingGetxServices c = Get.find();

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: colorblue,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 209,
                  child: Center(
                    child: Form(
                      key: Editprofil1,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'isEmpty';
                          } else {
                            print('isNotEmpty');
                          }
                          return null;
                        },
                        keyboardType:
                            number_fild == true ? TextInputType.phone : null,
                        onChanged: (value) {
                          print(key.toString());
                          if (key.toString() == "[<'anas1'>]") {
                            c.name.value = value;
                          }
                          if (key.toString() == "[<'anas2'>]") {
                            c.phon.value = value;
                          } else {
                            print("nulllllll");
                          }
                        },
                        decoration: InputDecoration(
                          hintText: testhint,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 223, 221, 217),
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 223, 221, 217)),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                          border: InputBorder.none,
                          fillColor: colorwhite,
                          filled: true,
                        ),
                        obscureText: obscure_Text,
                      ),
                    ),
                  ),
                ),
                button_Seave_cansel(
                  key: Key('v'),
                  colorbutton: colorwhite,
                  textbutton: '82'.tr,
                  colortext: colorblue,
                  width: 0,
                ),
                const SizedBox(
                  height: 33,
                )
              ],
            ),
          );
        });
  }
}

class button_Seave_cansel extends StatelessWidget {
  const button_Seave_cansel(
      {super.key,
      required this.textbutton,
      required this.colorbutton,
      required this.colortext,
      required this.width});
  final String textbutton;
  final Color colorbutton;
  final double width;
  final Color colortext;
  @override
  Widget build(BuildContext context) {
    settingGetxServices c = Get.find();
    return ElevatedButton(
      onPressed: () {
        // ignore: curly_braces_in_flow_control_structures
        if (key.toString() == "[<'v'>]") if (Editprofil1.currentState!
            .validate()) {
          Get.back();
        }
        if (key!.toString() == "[<'seave'>]") {
          sharedPreferences!.setString('name', c.name.value);
          sharedPreferences!.setString('phon', c.phon.value);
          sharedPreferences!.setString('pass', c.pass.value);
          Get.back();
        }
        if (key!.toString() == "[<'end'>]") {
          Get.back();
        }
        //

        // print(key.toString());
        // Get.back();
      },
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: width), backgroundColor: colorbutton),
      child: Text(
        textbutton,
        style: TextStyle(
          fontFamily: fontType,
          color: colortext,
        ),
      ),
    );
  }
}
