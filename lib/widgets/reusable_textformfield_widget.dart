import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget prefix, suffixIcon;
  final IconData iconData;
  final Function validator;
  final TextInputType keyboardType;
  final FocusNode focusNode;

  ReusableTextFormField({
    @required this.hintText,
    @required this.iconData,
    @required this.controller,
    @required this.keyboardType,
    @required this.validator,
    @required this.focusNode,
    this.prefix,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textAlign: TextAlign.start,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      style: TextStyle(),
      onChanged: (value) {},
      autofocus: false,
      decoration: InputDecoration(
        filled: true,
        suffixIcon: suffixIcon,
        prefixIcon: Icon(iconData),
        prefix: prefix,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
