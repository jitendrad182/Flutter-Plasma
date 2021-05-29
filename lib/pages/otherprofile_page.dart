import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plasma/pages/chat.dart';
import 'package:plasma/pages/main_page.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/reusable_textbutton_widget.dart';

class ProfilePageOther extends StatefulWidget {
  final name,
      pic,
      email,
      phone,
      bloodGroup,
      age,
      address,
      stateName,
      cityName,
      gender,
      uid;
  ProfilePageOther({
    this.name,
    this.pic,
    this.email,
    this.phone,
    this.bloodGroup,
    this.age,
    this.address,
    this.uid,
    this.cityName,
    this.stateName,
    this.gender,
  });
  @override
  _ProfilePageOtherState createState() => _ProfilePageOtherState();
}

class _ProfilePageOtherState extends State<ProfilePageOther> {
  getAndSetMessage() {
    Get.to(ChatPage(
      name: widget.name,
      email: widget.email,
      uid: widget.uid,
      pic: widget.pic,
      chatRoom: false,
    ));
  }

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(widget.pic, height: 90, width: 90)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 6),
            child: Text(widget.name, style: TextStyle(fontSize: 22)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Blood Group', style: TextStyle(fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child:
                      Text(widget.bloodGroup, style: TextStyle(fontSize: 20)),
                ),
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Age', style: TextStyle(fontSize: 18)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Text(widget.age, style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('Address',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
                Text(widget.address,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          widget.email != AuthMethods.email
              ? ReusableTextButton(
                  buttonTitle: 'Chat with ${widget.name}',
                  buttonColor: kButtonColor,
                  onPressed: () {
                    getAndSetMessage();
                  },
                )
              : Center()
        ],
      ),
    );
  }
}
