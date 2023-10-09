// ignore_for_file: file_names

import 'package:flutter/material.dart';

class MATUtils {
  Widget customTextField(
      {required String text, TextEditingController? controller}) {
    return TextField(
      autofocus: false,
      controller: controller,
      style: const TextStyle(fontSize: 15.0, color: Colors.black),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: text,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.only(left: 14.0, bottom: 20.0, top: 20.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget customText(String text, double? size, Color color) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, fontWeight: FontWeight.w500, color: color),
    );
  }

  customColors(int i) {
    return [
      Color.fromARGB(255, 58, 143, 213),
      Color.fromARGB(255, 223, 187, 7),
      Color.fromARGB(255, 12, 156, 81),
      Color.fromARGB(255, 236, 75, 57),
      Color.fromARGB(255, 211, 56, 239),
      Color.fromARGB(255, 41, 147, 234),
      Color.fromARGB(255, 4, 37, 16),
    ];
  }

  showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
