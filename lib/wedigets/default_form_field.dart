import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    this.onTap,
    required this.controller,
    required this.type,
    this.validator,
    required this.labelText,
    required this.PrefixIcon,
    this.suffixIcon,
    this.radius,
    this.maxLines,
  });
  final double? radius;
  final bool isClickable = true;
  final Function()? onTap;
  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validator;
  final String labelText;
  final IconData PrefixIcon;
  final int? maxLines;
  final IconData? suffixIcon;
  final bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? 16),
          ),
          prefixIcon: Icon(PrefixIcon),
          suffixIcon: Icon(suffixIcon),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 18,
            color: Get.isDarkMode
                ? const Color.fromRGBO(253, 253, 253, 1.0)
                : const Color.fromRGBO(1, 29, 33, 1.0),
            fontWeight: FontWeight.bold,
          )),
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      validator: validator,
      onTap: onTap,
    );
  }
}
