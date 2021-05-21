import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:plasma/pages/filter2.dart';
import 'package:plasma/pages/filtereddonors.dart';
import 'package:plasma/services/location.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/reusable_bllodgroup_dropdown.dart';
import 'package:plasma/widgets/reusable_city_dropdown.dart';
import 'package:plasma/widgets/reusable_textbutton_widget.dart';
import 'package:plasma/widgets/state_dropdown.dart';

class DataSortingPage extends StatefulWidget {
  @override
  _DataSortingPageState createState() => _DataSortingPageState();
}

class _DataSortingPageState extends State<DataSortingPage> {
  final _key = GlobalKey<FormState>();
  String _bloodGroup, _city, _state;
  bool _inAsyncCall = false;

  onPressed() {
    if (_key.currentState.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FilteredDonorsPage(
            city: _city,
            state: _state,
            bloodGroup: _bloodGroup,
          ),
        ),
      );
    }
  }

  onPressedLocation() async {
    setState(() {
      _inAsyncCall = true;
    });
    await LocationByLocation().getLocation();
    var pinCode = LocationByLocation.pinCode;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Filter2(pinCode),
      ),
    );
    setState(() {
      _inAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              tooltip: 'Filter Donors by current location',
              icon: Icon(Icons.location_on_sharp),
              splashRadius: 25,
              onPressed: () {
                onPressedLocation();
              },
            ),
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: _inAsyncCall,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      BloodGroupDropDown(
                        hint: 'Blood Group',
                        value: _bloodGroup,
                        validator: (val) {
                          return val == null
                              ? 'Please select Blood Group'
                              : null;
                        },
                        onChanged: (String value) {
                          setState(() {
                            _bloodGroup = value;
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
                    ],
                  ),
                ),
                ReusableTextButton(
                  buttonTitle: 'Apply Changes',
                  buttonColor: kButtonColor,
                  onPressed: () {
                    onPressed();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
