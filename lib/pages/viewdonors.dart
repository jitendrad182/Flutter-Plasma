import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plasma/pages/data_sorting_page.dart';
import 'package:plasma/services/database.dart';
import 'package:plasma/widgets/usersinfowidget.dart';

class ViewDonors extends StatefulWidget {
  @override
  _ViewDonorsState createState() => _ViewDonorsState();
}

class _ViewDonorsState extends State<ViewDonors> {
  Stream _usersStream;
  doThis() async {
    setState(() {});
    _usersStream = await DataBaseMethods().getDonorUsersInfo();
    setState(() {});
  }

  @override
  void initState() {
    doThis();
    super.initState();
  }

  Widget usersInfoWidget() {
    return StreamBuilder(
      stream: _usersStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return UsersInfo(
                    name: ds['name'],
                    pic: ds['pic'],
                    email: ds['email'],
                    phone: ds['phone'],
                    bloodGroup: ds['bloodGroup'],
                    age: ds['age'],
                    address: ds['address'],
                    stateName: ds['cityName'],
                    cityName: ds['cityName'],
                    gender: ds['gender'],
                    uid: ds['uid'],
                  );
                },
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donors'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              icon: Icon(Icons.filter_list_sharp),
              splashRadius: 25,
              onPressed: () {
                Get.to(DataSortingPage());
              },
            ),
          )
        ],
      ),
      body: usersInfoWidget(),
    );
  }
}
