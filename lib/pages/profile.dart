import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plasma/pages/main_page.dart';
import 'package:plasma/utilities/const.dart';

class UserProfile extends StatefulWidget {
  final String name, email, pic, uid;
  UserProfile({this.email, this.pic, this.name, this.uid});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            splashRadius: 25,
            icon: Icon(
              Icons.close,
              color: kButtonColor,
            ),
            onPressed: () {
              Get.offAll(MainPage());
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image.network(widget.pic, height: 90, width: 90)),
            ),
          ),
          Text(
            widget.name,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              widget.email,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
