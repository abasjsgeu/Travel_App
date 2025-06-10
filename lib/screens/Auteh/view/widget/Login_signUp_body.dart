import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/Auteh/controller/languges_Controller.dart';
import 'package:travel_app1/screens/Auteh/view/widget/Icon_List_Bass.dart';
import 'package:travel_app1/screens/Auteh/view/widget/cusm_elevatedButton.dart';
import 'package:travel_app1/screens/Auteh/view/widget/welcom_Text.dart';

class Login_signUp_body extends StatefulWidget {
  const Login_signUp_body({super.key});

  @override
  State<Login_signUp_body> createState() => _Login_signUp_bodyState();
}

class _Login_signUp_bodyState extends State<Login_signUp_body> {
  LangugesController langugesController = Get.find();
  LangugesController langugesController1 = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    langugesController.selectedLanguage.value = "EN";
    langugesController.selectedLanguage1.value = "AR";
    // sharedPreferences!.setString("lang", sharedPreferences!.getString("lang")!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 9),
      color: Color(0xffECF0F3),
      child: Stack(
        children: [
          const Directionality(
            textDirection: TextDirection.ltr,
            child: IconBass(),
          ),
          welcom_Text(
            text1: "1".tr,
            text2: "2".tr,
          ),
          Positioned(
            top: 150,
            left: 140,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorblue),
                        onPressed: () {
                          langugesController.changLangues("en");
                        },
                        child: Text(
                          "EN",
                          style: TextStyle(
                              color: colorwhite, fontFamily: fontType),
                        )),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: colorblue),
                        onPressed: () {
                          langugesController1.changLangues1("ar");
                        },
                        child: Text(
                          "AR",
                          style: TextStyle(
                              color: colorwhite, fontFamily: fontType),
                        )),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 98, bottom: 15, left: 87),
                child: cusm_elevatedButton(
                  text: "2".tr,
                  width: 3,
                  color: const Color.fromARGB(0, 0, 0, 0),
                  colortext: const Color.fromARGB(239, 33, 90, 188),
                  onPrees: () {
                    Get.toNamed('/create_Accont_veiw');
                  },
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(right: 98, bottom: 15, left: 87),
                  child: cusm_elevatedButton(
                    width: 0,
                    color: Color.fromARGB(255, 25, 53, 102),
                    text: "1".tr,
                    colortext: Colors.white,
                    onPrees: () {
                      Get.toNamed('/Login_view');
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }

  void _chang_languges(LangugesController langugesController) {}

  void _chang_en(LangugesController langugesController1) {}
}
