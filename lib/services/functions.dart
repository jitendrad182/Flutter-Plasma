import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasma/pages/opening_page.dart';
import 'package:plasma/services/auth.dart';

class Functions {
  signMeOut(BuildContext context) async {
    try {
      await AuthMethods().signOut().then(
        (value) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => OpeningPage()));
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
