// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget MyTextFormFeild(
    {TextEditingController? controller,
    String? hintText,
    bool showText = false}) {
  return TextFormField(
    controller: controller,
    obscureText: showText,
    decoration: InputDecoration(
      hintText: hintText,
      border: InputBorder.none,
    ),
  );
}


