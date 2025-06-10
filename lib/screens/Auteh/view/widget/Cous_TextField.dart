import 'package:flutter/material.dart';
import 'package:travel_app1/constants.dart';
import 'package:travel_app1/main.dart';

class Cous_TextField extends StatelessWidget {
  Cous_TextField({
    super.key,
    this.icon,
    required this.text,
    this.tex,
    this.number,
    required this.formKey2,
    this.validator_text,
  });
  final Widget? icon;
  final String text;
  final bool? number;
  final String? Function(String?)? validator_text;
  final Function(String)? tex;
  GlobalKey<FormState> formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey2,
      child: TextFormField(
        style: TextStyle(
          fontFamily: fontType,
        ),
        validator: validator_text,
        onChanged: tex,
        // maxLength: 10,
        keyboardType: number == true ? TextInputType.phone : null,
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          suffixIcon: icon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 6),
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
