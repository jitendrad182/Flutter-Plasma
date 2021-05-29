import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/reusable_textbutton_widget.dart';

class OpeningPage extends StatefulWidget {
  @override
  _OpeningPageState createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  bool _inAsyncCall = false;
  signMeIn() async {
    setState(() {
      _inAsyncCall = true;
    });
    await AuthMethods().signInWithGoogle();
    setState(() {
      _inAsyncCall = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _inAsyncCall,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(110),
                  child: Image.asset('assets/images/ju.png',
                      height: 110, width: 110)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                'PLASMA',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    fontFamily: 'Pacifico'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 10, right: 10),
              child: Text(
                'ONE HELP CAN BRING A BIG CHANGE',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            ReusableTextButton(
              buttonTitle: 'Sign in',
              buttonColor: kButtonColor,
              onPressed: () {
                signMeIn();
              },
            )
          ],
        ),
      ),
    );
  }
}
