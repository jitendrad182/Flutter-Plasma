import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plasma/pages/otherprofile_page.dart';
import 'package:plasma/utilities/const.dart';

class UsersInfo extends StatelessWidget {
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

  UsersInfo({
    this.name,
    this.phone,
    this.email,
    this.address,
    this.age,
    this.bloodGroup,
    this.pic,
    this.uid,
    this.gender,
    this.stateName,
    this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: kMainColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextButton(
        onPressed: () {
          Get.to(ProfilePageOther(
            name: name,
            pic: pic,
            email: email,
            phone: phone,
            bloodGroup: bloodGroup,
            age: age,
            address: address,
            uid: uid,
            cityName: cityName,
            stateName: stateName,
            gender: gender,
          ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(55),
                child: Image.network(pic, height: 55, width: 55),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$gender      $bloodGroup      $age Year",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
