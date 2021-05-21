import 'package:flutter/material.dart';

class StateDropDown extends StatelessWidget {
  final String value;
  final Function onChanged, validator;

  StateDropDown({
    @required this.value,
    @required this.onChanged,
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
          prefixIcon: Icon(Icons.location_city),
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
        items:
            <String>['Rajasthan'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        hint: Text(
          "Select State",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onChanged: onChanged,
      ),
    );
  }
}

//final List<String> stateList = [
//     'Andhra Pradesh',
//     'Arunachal Pradesh',
//     'Assam',
//     'Bihar',
//     'Chhattisgarh',
//     'Goa',
//     'Gujarat',
//     'Haryana',
//     'Himachal Pradesh',
//     'Jammu and Kashmir',
//     'Jharkhand',
//     'Karnataka',
//     'Kerala',
//     'Madhya Pradesh',
//     'Maharashtra',
//     'Manipur',
//     'Meghalaya',
//     'Mizoram',
//     'Nagaland',
//     'Odisha',
//     'Punjab',
//     'Rajasthan',
//     'Sikkim',
//     'Tamil Nadu',
//     'Telangana',
//     'Tripura',
//     'Uttarakhand',
//     'Uttar Pradesh',
//     'West Bengal',
//     'Andaman and Nicobar Islands',
//     'Chandigarh',
//     'Dadra and Nagar Haveli',
//     'Daman and Diu',
//     'Delhi',
//     'Lakshadweep',
//     'Puducherry',
//   ];
