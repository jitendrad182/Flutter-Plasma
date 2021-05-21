import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasma/pages/form2.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/reusable_city_dropdown.dart';
import 'package:plasma/widgets/reusable_donor_or_eceiver_dropdown.dart';
import 'package:plasma/widgets/reusable_textbutton_widget.dart';
import 'package:plasma/widgets/reusable_textformfield_widget.dart';
import 'package:plasma/widgets/state_dropdown.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _addressController = TextEditingController();
  final _pinCode = TextEditingController();
  final _focusNode = FocusNode();
  final _pinCodeNode = FocusNode();
  final _key = GlobalKey<FormState>();
  String _donorOrReceiver, _city, _state;

  next() {
    if (_key.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Form2(
            donor: _donorOrReceiver == 'I am donor' ? true : false,
            state: _state,
            city: _city,
            address: _addressController.text,
            pinCode: _pinCode.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  DonorOrReceiver(
                    value: _donorOrReceiver,
                    validator: (val) {
                      return val == null ? 'Please select a Value' : null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        _donorOrReceiver = value;
                      });
                    },
                  ),
                  StateDropDown(
                    value: _state,
                    validator: (val) {
                      return val == null ? 'Please select State' : null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        _state = value;
                      });
                    },
                  ),
                  CityDropDown(
                    value: _city,
                    validator: (val) {
                      return val == null ? 'Please select City' : null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        _city = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: ReusableTextFormField(
                      focusNode: _pinCodeNode,
                      validator: (val) {
                        return val.length != 6
                            ? 'Please Enter Valid PinCode'
                            : null;
                      },
                      hintText: "PinCode",
                      iconData: Icons.pin_drop,
                      controller: _pinCode,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: ReusableTextFormField(
                      focusNode: _focusNode,
                      validator: (val) {
                        return val == '' ? 'Please Enter Address' : null;
                      },
                      hintText: "Address",
                      iconData: Icons.location_city,
                      controller: _addressController,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ReusableTextButton(
            buttonTitle: 'Next',
            buttonColor: kButtonColor,
            onPressed: () {
              next();
              _focusNode.unfocus();
              _pinCodeNode.unfocus();
            },
          )
        ],
      ),
    );
  }
}
