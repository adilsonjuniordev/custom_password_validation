import 'package:flutter/material.dart';
import 'package:password_validation/src/shared/colors_app.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final String? hintText;
  final Color backgroundColor;
  final Widget? suffixIcon;

  final Key? textFieldKey;
  final bool obscureText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;

  const CustomTextfield({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.controller,

    this.textFieldKey,
    this.focusNode,
    this.validator,
    this.obscureText = false,
    this.hintText,
    this.suffixIcon,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    final CustomTextfield(
      :hintText,
      :label,
      :backgroundColor,
      suffixIcon: suffix,
      :textFieldKey,
      :controller,
      :validator,
      :focusNode,
      :obscureText,
    ) = widget;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        TextFormField(
          key: textFieldKey,
          controller: controller,
          validator: validator,
          focusNode: focusNode,
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            isDense: true,
            hintText: hintText,
            suffixIcon: suffix,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
