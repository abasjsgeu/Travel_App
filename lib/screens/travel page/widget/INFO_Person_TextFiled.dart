import 'package:flutter/material.dart';

import '../../../constants.dart';

class INFO_Person_TextFiled extends StatelessWidget {
  INFO_Person_TextFiled(
      {super.key,
      required this.name,
      required this.width,
      required this.typeinput,
      this.fieldkey,
      this.max,
      this.valdet,
      required this.onchang,
      this.hinttext});
  final String name;
  final double width;
  final int? max;
  final String? hinttext;
  final Function(String) onchang;
  final TextInputType typeinput;
  final String? Function(String?)? valdet;
  final GlobalKey<FormState>? fieldkey;
  // final TextInputType keyType;
  // final String labletext;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          name,
          style: TextStyle(fontFamily: fontType),
        ),
        SizedBox(
          width: width,
          child: Form(
            key: fieldkey,
            child: TextFormField(
              maxLength: max != null ? max : null,
              onChanged: onchang,
              validator: valdet,
              style: TextStyle(fontFamily: fontType),
              keyboardType: typeinput,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black12),
                hintText: hinttext,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red)),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 14, 92, 201),
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
            ),
          ),
        )
      ],
    );
  }
}
