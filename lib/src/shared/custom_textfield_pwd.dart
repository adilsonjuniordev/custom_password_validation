import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/custom_textfield.dart';

class CustomTextfieldPwd extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final TextEditingController controller;

  const CustomTextfieldPwd({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.controller,
  });

  @override
  State<CustomTextfieldPwd> createState() => _CustomTextfieldPwdState();
}

class _CustomTextfieldPwdState extends State<CustomTextfieldPwd> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    final CustomTextfieldPwd(:label, :backgroundColor, :controller) = widget;

    return CustomTextfield(
      label: label,
      backgroundColor: backgroundColor,
      controller: controller,
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        icon:
            obscureText
                ? Icon(Icons.visibility_outlined)
                : Icon(Icons.visibility_off_outlined),
      ),
    );
  }
}
