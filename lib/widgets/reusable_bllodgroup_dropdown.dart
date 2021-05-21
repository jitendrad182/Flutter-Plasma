import 'package:flutter/material.dart';

class BloodGroupDropDown extends StatelessWidget {
  final String value, hint;
  final Function onChanged, validator;

  BloodGroupDropDown({
    @required this.value,
    @required this.onChanged,
    @required this.hint,
    @required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DropdownButtonFormField<String>(
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: Icon(Icons.circle),
          hintStyle: TextStyle(color: Colors.grey),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        focusColor: Colors.white,
        value: value,
        style: TextStyle(color: Colors.white),
        iconEnabledColor: Colors.black,
        items: <String>[
          'A +',
          'A -',
          'B +',
          'B -',
          'AB +',
          'AB -',
          'O +',
          'O -',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        hint: Text(
          hint,
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
