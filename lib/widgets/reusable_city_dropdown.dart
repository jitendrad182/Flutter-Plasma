import 'package:flutter/material.dart';

class CityDropDown extends StatelessWidget {
  final String value;
  final Function onChanged, validator;

  CityDropDown({
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
        items: <String>[
          "Ajmer",
          "Alwar",
          "Banswara",
          "Baran",
          "Barmer",
          "Bharatpur",
          "Bhilwara",
          "Bikaner",
          "Bundi",
          "Chittorgarh",
          "Churu",
          "Dausa",
          "Dholpur",
          "Dungarpur",
          "Hanumangarh",
          "Jaipur",
          "Jaisalmer",
          "Jalore",
          "Jhalawar",
          "Jhunjhunu",
          "Jodhpur",
          "Karauli",
          "Kota",
          "Nagaur",
          "Pali",
          "Pratapgarh",
          "Rajsamand",
          "Sawai Madhopur",
          "Sikar",
          "Sirohi",
          "Sri Ganganagar",
          "Tonk",
          "Udaipur",
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
          "Select City",
          style: TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
