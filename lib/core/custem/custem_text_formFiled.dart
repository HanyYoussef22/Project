import 'package:flutter/material.dart';

Widget customField({
  VoidCallback? fieldTapping,
  required String name,
  IconData? prefixIcon,
  Color? fillColor,
  required String? Function(String?) validate,
  IconButton? suffixIcon,
  required TextEditingController controller,
  bool? obsecureText,
  bool? autofocus,
}) {
  return TextFormField(
    autofocus: autofocus ?? false,
    controller: controller,
    validator: validate,
    onTap: fieldTapping,
    obscureText: obsecureText ?? false,
    decoration: InputDecoration(
      hintText: name,
      suffixIcon: suffixIcon,
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontFamily: 'Poppins',
        // fontWeight: FontWeight.w600,
      ),
      // prefixIcon: Icon(prefixIcon),
      filled: true,
      fillColor: fillColor,
      enabledBorder:  buildOutlineInputBorder(),
      focusedBorder:  buildOutlineInputBorder(),
    ),
  );
}

OutlineInputBorder buildOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(10),
  );
}
