import 'package:flutter/material.dart';
import 'package:registration_app/resources/components/color.dart';

Widget titleText({
  String? name,
}) {
  return Text(
    name!,
    style: const TextStyle(
        color: Color.fromARGB(255, 44, 78, 94),
        fontSize: 35,
        fontWeight: FontWeight.bold),
  );
}

Widget subtitleText({
  String? name,
}) {
  return Text(
    name!,
    style: const TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        fontSize: 24,
        fontWeight: FontWeight.bold),
  );
}

Widget subtext({
  String? name,
}) {
  return Text(
    name!,
    style: const TextStyle(
        color: elementcolor, fontSize: 16, fontWeight: FontWeight.bold),
  );
}
