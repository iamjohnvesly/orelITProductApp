import 'package:flutter/material.dart';

Widget commonbackArrowButton(context) {
  return InkWell(
    splashColor: Colors.black,
    highlightColor: Colors.black,
    onTap: () {
      Navigator.pop(context);
    },
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Icon(Icons.arrow_back_ios_outlined, size: 24),
    ),
  );
}
