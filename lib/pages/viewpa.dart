import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plasma/services/database.dart';
import 'package:plasma/widgets/usersinfowidget.dart';

class ViewPatients extends StatefulWidget {
  @override
  _ViewPatientsState createState() => _ViewPatientsState();
}

class _ViewPatientsState extends State<ViewPatients> {
  Stream _usersStream;
  doThis() async {
    setState(() {});
    _usersStream = await DataBaseMethods().getPatientUsersInfo();
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
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patients')),
      body: usersInfoWidget(),
    );
  }
}
