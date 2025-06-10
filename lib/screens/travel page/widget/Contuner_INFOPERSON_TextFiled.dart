// ignore_for_file: body_might_complete_normally_nullable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';
import 'package:travel_app1/screens/travel%20page/controller/add_person.dart';
import 'package:travel_app1/screens/travel%20page/model/percon_info.dart';
import 'package:travel_app1/screens/travel%20page/widget/Elevated_Button.dart';
import 'package:travel_app1/screens/travel%20page/widget/INFO_Person_TextFiled.dart';
import 'package:travel_app1/screens/travel%20page/widget/Price.dart';
import 'package:travel_app1/screens/travel%20page/widget/number_Person.dart';

class Contuner_INFOPERSON_TextFiled extends StatefulWidget {
  Contuner_INFOPERSON_TextFiled({
    super.key,
    required this.data,
    required this.s,
  });
  final Person? data;
  final bool s;
  @override
  State<Contuner_INFOPERSON_TextFiled> createState() =>
      _Contuner_INFOPERSON_TextFiledState();
}

class _Contuner_INFOPERSON_TextFiledState
    extends State<Contuner_INFOPERSON_TextFiled> {
  @override
  PersonController n = Get.put(PersonController());

  void initState() {
    print(widget.data?.Box);
    print(widget.key);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PersonController controller = Get.find<PersonController>();

    return Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: widget.s != true
              ? GetX<PersonController>(
                  builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...List.generate(
                            controller.persons.length,
                            (index) {
                              final prs = controller.persons[index];
                              return _Fields(
                                prs: prs,
                                ind: index,
                                key: ValueKey(prs),
                              );
                            },
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetwe en,
                              children: [
                                const Price(),
                                const SizedBox(
                                  width: 80,
                                ),
                                Elevated_Button(
                                  onPrees: () async {
                                    final isValid =
                                        await validateForm(controller);
                                    if (!isValid) {
                                      print('Validation failed');

                                      return;
                                    } // print(controller.persons[0].fathername);
                                    await AddPerson_IN_dartabse(controller)
                                        .then((_) => Get.offAllNamed(
                                            '/Succeeded_BooKing_view'));
                                  },
                                  text: "65".tr,
                                  w: 160,
                                  h: 60,
                                  background: colorblue,
                                  colorText: colorwhite,
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
              : Column(
                  children: [
                    _Fields_Edit(
                      data: widget.data,
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetwe en,
                        children: [
                          const Price(),
                          const SizedBox(
                            width: 80,
                          ),
                          Elevated_Button(
                            onPrees: () async {
                              final isValid =
                                  await validateForm_update(widget.data!);
                              if (!isValid) {
                                print('Validation failed');

                                return;
                              } // print(controller.persons[0].fathername);
                              await Updat_Person_IN_dartabse(controller);
                            },
                            text: "65".tr,
                            w: 160,
                            h: 60,
                            background: colorblue,
                            colorText: colorwhite,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ));
  }

  Future<void> Updat_Person_IN_dartabse(PersonController controller) async {
    await controller.updata_percon(
        first_name: widget.data?.first_name,
        last_name: widget.data?.lastname,
        mother_name: widget.data?.mothername,
        father_name: widget.data?.fathername!,
        age: widget.data?.age,
        Box: widget.data?.Box,
        mobile: widget.data?.mobleNumber.toString(),
        national_id: widget.data?.NationaID.toString());
  }
}

Future<void> AddPerson_IN_dartabse(PersonController controller) async {
  for (int i = 0; i < controller.persons.length; i++) {
    await controller.Info_person(
        first_name: controller.persons[i].first_name!,
        last_name: controller.persons[i].lastname!,
        mother_name: controller.persons[i].mothername!,
        father_name: controller.persons[i].fathername!,
        age: controller.persons[i].age,
        Box: controller.persons[i].Box!,
        mobile: controller.persons[i].mobleNumber.toString(),
        national_id: controller.persons[i].NationaID.toString());
  }
}

Future<bool> validateForm_update(Person data) async {
  if (data.formKeys['firstname']?.currentState!.validate() != true ||
      data.formKeys['lastname']?.currentState!.validate() != true ||
      data.formKeys['Box']?.currentState!.validate() != true ||
      data.formKeys['mothername']?.currentState!.validate() != true ||
      data.formKeys['fathername']?.currentState!.validate() != true ||
      data.formKeys['age']?.currentState!.validate() != true ||
      data.formKeys['mobileNumber']?.currentState!.validate() != true ||
      data.formKeys['nationalID']?.currentState!.validate() != true) {
    return false; // إذا كان أي حقل غير صالح، نعيد false
  }
  return true;
}

Future<bool> validateForm(PersonController controller) async {
  for (int i = 0; i < controller.persons.length; i++) {
    if (controller.persons[i].formKeys['firstname']!.currentState?.validate() !=
            true ||
        controller
                .persons[i].formKeys['Box']!.currentState
                ?.validate() !=
            true ||
        controller
                .persons[i].formKeys['mothername']!.currentState
                ?.validate() !=
            true ||
        controller
                .persons[i].formKeys['fathername']!.currentState
                ?.validate() !=
            true ||
        controller
                .persons[i].formKeys['age']!.currentState
                ?.validate() !=
            true ||
        controller.persons[i].formKeys['mobileNumber']!.currentState
                ?.validate() !=
            true ||
        controller.persons[i].formKeys['nationalID']!.currentState
                ?.validate() !=
            true) {
      return false; // إذا كان أي حقل غير صالح، نعيد false
    }
  }
  return true;
}

class _Fields extends StatelessWidget {
  _Fields({this.ind, Key? key, this.data, this.prs}) : super(key: key);
  final int? ind; // ← اسمح بـ null
  final Person? data;
  final Person? prs;

  @override
  Widget build(BuildContext context) {
    final PersonController controller = Get.find<PersonController>();
    final person = controller.persons[ind!];

    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (controller.persons.length != 1)
          _deleat(controller, ind! // تعيين Key فريد
              ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            INFO_Person_TextFiled(
              hinttext: data?.lastname,
              onchang: (p0) {
                controller.persons[ind!].lastname = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "54".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: person.formKeys['lastname']!,
            ),
            INFO_Person_TextFiled(
              hinttext: data?.first_name,
              onchang: (p0) {
                controller.persons[ind!].first_name = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "53".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: person.formKeys['firstname']!,
            ),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            INFO_Person_TextFiled(
              max: null,
              hinttext: data?.Box,
              onchang: (p1) {
                controller.persons[ind!].Box = p1;
              },
              valdet: (p1) {
                if (p1!.isEmpty) return "isEmpty";
              },
              name: "56".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: person.formKeys['Box']!,
            ),
            INFO_Person_TextFiled(
              hinttext: data?.mothername,
              max: null,
              onchang: (p0) {
                controller.persons[ind!].mothername = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "55".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: person.formKeys['mothername']!,
            ),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            INFO_Person_TextFiled(
              hinttext: data?.age,
              max: null,
              onchang: (p0) {
                controller.persons[ind!].age = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "57".tr,
              width: 120,
              typeinput: TextInputType.number,
              fieldkey: person.formKeys['age']!,
            ),
            INFO_Person_TextFiled(
              hinttext: data?.fathername,
              max: null,
              onchang: (p0) {
                controller.persons[ind!].fathername = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "55".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: person.formKeys['fathername']!,
            ),
          ],
        ),
        INFO_Person_TextFiled(
          hinttext: data?.mobleNumber,
          max: 10,
          name: "61".tr,
          width: 220,
          typeinput: TextInputType.phone,
          fieldkey: person.formKeys['mobileNumber']!,
          onchang: (p0) {
            controller.persons[ind!].mobleNumber = p0;
          },
          valdet: (p0) {
            if (p0!.length != 10) return "is Short";

            if (p0!.isEmpty) return "isEmpty";
          },
        ),
        INFO_Person_TextFiled(
          hinttext: data?.NationaID,
          max: null,
          onchang: (p0) {
            controller.persons[ind!].NationaID = p0;
          },
          valdet: (p0) {
            if (p0!.isEmpty) return "isEmpty";
          },
          name: "63".tr,
          width: 220,
          typeinput: TextInputType.number,
          fieldkey: person.formKeys['nationalID']!,
        ),
        const number_Person(),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

class _Fields_Edit extends StatelessWidget {
  _Fields_Edit({
    Key? key,
    this.data,
  }) : super(key: key);
  final Person? data;

  @override
  Widget build(BuildContext context) {
    // final PersonController controller = Get.find<PersonController>();

    return Column(
      spacing: 30,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            INFO_Person_TextFiled(
              hinttext: data!.lastname,
              onchang: (p0) {
                data!.lastname = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "54".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: data!.formKeys['lastname'],
            ),
            INFO_Person_TextFiled(
              hinttext: data!.first_name,
              onchang: (p0) {
                data!.first_name = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "53".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: data!.formKeys['firstname'],
            ),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            INFO_Person_TextFiled(
              max: null,
              hinttext: data!.Box,
              onchang: (p1) {
                data!.Box = p1;
              },
              valdet: (p1) {
                if (p1!.isEmpty) return "isEmpty";
              },
              name: "56".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: data!.formKeys['Box'],
            ),
            INFO_Person_TextFiled(
              hinttext: data!.mothername,
              max: null,
              onchang: (p0) {
                data!.mothername = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "55".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: data!.formKeys['mothername'],
            ),
          ],
        ),
        Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            INFO_Person_TextFiled(
              hinttext: data!.age,
              max: null,
              onchang: (p0) {
                data!.age = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "57".tr,
              width: 120,
              typeinput: TextInputType.number,
              fieldkey: data!.formKeys['age'],
            ),
            INFO_Person_TextFiled(
              hinttext: data!.fathername,
              max: null,
              onchang: (p0) {
                data!.fathername = p0;
              },
              valdet: (p0) {
                if (p0!.isEmpty) return "isEmpty";
              },
              name: "55".tr,
              width: 120,
              typeinput: TextInputType.name,
              fieldkey: data!.formKeys['fathername'],
            ),
          ],
        ),
        INFO_Person_TextFiled(
          hinttext: data!.mobleNumber,
          max: 10,
          name: "61".tr,
          width: 220,
          typeinput: TextInputType.phone,
          fieldkey: data!.formKeys['mobileNumber'],
          onchang: (p0) {
            data!.mobleNumber = p0;
          },
          valdet: (p0) {
            if (p0!.length > 10) return "is Short";
            if (p0.isEmpty) return "isEmpty";
          },
        ),
        INFO_Person_TextFiled(
          hinttext: data?.NationaID,
          max: null,
          onchang: (p0) {
            data!.NationaID = p0;
          },
          valdet: (p0) {
            if (p0!.isEmpty) return "isEmpty";
          },
          name: "63".tr,
          width: 220,
          typeinput: TextInputType.number,
          fieldkey: data!.formKeys['nationalID'],
        ),
        const number_Person(),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}

Widget _deleat(
  PersonController controller,
  int ind,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              controller.deletePerson(ind);
            },
            child: Row(
              children: [
                const Icon(Icons.delete),
                const SizedBox(width: 5),
                Text(
                  "84".tr,
                  style: TextStyle(fontFamily: fontType),
                ),
              ],
            )),
      ],
    ),
  );
}
  // if (controller.persons[i].formKeys['lastname']!.currentState!.validate()) {
    //   controller.persons[i].formKeys['lastname']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['firstname']!.currentState!.validate()) {
    //   controller.persons[i].formKeys['firstname']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['Box']!.currentState!.validate()) {
    //   controller.persons[i].formKeys['Box']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['mothername']!.currentState!
    //     .validate()) {
    //   controller.persons[i].formKeys['mothername']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['fathername']!.currentState!
    //     .validate()) {
    //   controller.persons[i].formKeys['fathername']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['age']!.currentState!.validate()) {
    //   controller.persons[i].formKeys['age']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['mobileNumber']!.currentState!
    //     .validate()) {
    //   controller.persons[i].formKeys['mobileNumber']!.currentState?.save();
    // }
    // if (controller.persons[i].formKeys['nationalID']!.currentState!
    //     .validate()) {
    //   controller.persons[i].formKeys['nationalID']!.currentState?.save();
    // }


    //   controller.persons[i].formKeys['firstname']!.currentState?.validate();
    // controller.persons[i].formKeys['Box']!.currentState?.validate();
    // controller.persons[i].formKeys['mothername']!.currentState?.validate();
    // controller.persons[i].formKeys['fathername']!.currentState?.validate();
    // controller.persons[i].formKeys['age']!.currentState?.validate();
    // controller.persons[i].formKeys['mobileNumber']!.currentState?.validate();
    // controller.persons[i].formKeys['nationalID']!.currentState?.validate();