import 'package:flutter/material.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/services/database.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/male_or_female.dart';
import 'package:plasma/widgets/reusable_bllodgroup_dropdown.dart';
import 'package:plasma/widgets/reusable_textbutton_widget.dart';
import 'package:plasma/widgets/reusable_textformfield_widget.dart';

class Form2 extends StatefulWidget {
  final String city, state, address, pinCode;
  final bool donor;
  Form2({
    this.donor,
    this.state,
    this.city,
    this.address,
    this.pinCode,
  });
  @override
  _Form2State createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  final _ageController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ageFocusNode = FocusNode();
  final _phoneFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();
  String _bloodGroup, _maleOrFemale;

  dataSaving() async {
    if (_key.currentState.validate()) {
      {
        Map<String, dynamic> userInfoMap = {
          'email': AuthMethods.email,
          'name': AuthMethods.name,
          'pic': AuthMethods.pic,
          'uid': AuthMethods.uid,
          'cityName': widget.city,
          'address': widget.address,
          'bloodGroup': _bloodGroup,
          'phone': _phoneController.text,
          'donor': widget.donor,
          'stateName': widget.state,
          'age': _ageController.text,
          'gender': _maleOrFemale,
          'pinCode': widget.pinCode,
        };
        await DataBaseMethods()
            .saveUserInfo(userId: AuthMethods.uid, userInfoMap: userInfoMap)
            .then((value) {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registration Form')),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ReusableTextFormField(
                      focusNode: _phoneFocusNode,
                      hintText: 'Phone',
                      validator: (val) {
                        return val.length != 10
                            ? 'Please Enter valid Phone Number'
                            : null;
                      },
                      prefix:
                          Text('+91', style: TextStyle(color: Colors.black)),
                      iconData: Icons.call,
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ReusableTextFormField(
                      focusNode: _ageFocusNode,
                      hintText: widget.donor == true
                          ? "Donor's Age"
                          : "Patient's Age",
                      validator: (val) {
                        return val == '' ? 'Please select Age' : null;
                      },
                      iconData: Icons.person,
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  MaleOrFemaleDropDown(
                    value: _maleOrFemale,
                    hint: widget.donor == true
                        ? "Donor's Gender"
                        : "Patient's Gender",
                    validator: (val) {
                      return val == null ? 'Please select Gender' : null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        _maleOrFemale = value;
                      });
                    },
                  ),
                  BloodGroupDropDown(
                    hint: widget.donor == true
                        ? "Donor's Blood Group"
                        : "Patient's Blood Group",
                    value: _bloodGroup,
                    validator: (val) {
                      return val == null ? 'Please select Blood Group' : null;
                    },
                    onChanged: (String value) {
                      setState(() {
                        _bloodGroup = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          ReusableTextButton(
            buttonTitle: 'Finish',
            buttonColor: kButtonColor,
            onPressed: () {
              dataSaving();
              _ageFocusNode.unfocus();
              _phoneFocusNode.unfocus();
            },
          )
        ],
      ),
    );
  }
}
