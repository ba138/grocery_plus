import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Icon? prefixIcon;
  final int maxLines;
  final Icon? suffixIcon;
  final Function()? ontap;
  final TextEditingController controller;
  void Function(String)? onChanged;

  CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.prefixIcon,
    required this.controller,
    this.suffixIcon,
    this.ontap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: prefixIcon,
          fillColor: Color(0xffF0F1F2),
          filled: true,
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.transparent))),
    );
  }
}
