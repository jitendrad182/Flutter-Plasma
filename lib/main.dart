import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:plasma/pages/main_page.dart';
import 'package:plasma/pages/ntroduction_pages.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/utilities/const.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(primaryColor: kMainColor),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, snapshot) {
          return snapshot.hasData ? MainPage() : IntroductionPages();
        },
      ),
    );
  }
}
