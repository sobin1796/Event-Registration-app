import 'package:flutter/material.dart';
import 'package:registration_app/resources/components/color.dart';

Widget botton({
  String? name,
  double? width,
  double? height,
}) {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width!, height!),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: elementcolor),
      child: Text(
        name!,
        style: const TextStyle(color: Color.fromARGB(255, 243, 243, 243)),
      ));
}

Widget textboxfield(
    {String? labeltext,
    Widget? suffixIcon,
    required TextEditingController emailController,
    required context}) {
  return TextFormField(
    controller: emailController,
    decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 159, 161, 188),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: labeltext!,
        labelStyle:
            const TextStyle(color: elementcolor, fontWeight: FontWeight.bold)),
    style: const TextStyle(color: elementcolor, fontWeight: FontWeight.bold),
  );
}
