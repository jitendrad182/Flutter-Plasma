import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plasma/services/database.dart';
import 'package:plasma/widgets/usersinfowidget.dart';

class FilteredDonorsPage extends StatefulWidget {
  final String city, state, bloodGroup;
  FilteredDonorsPage({this.bloodGroup, this.state, this.city});
  @override
  _FilteredDonorsPageState createState() => _FilteredDonorsPageState();
}

class _FilteredDonorsPageState extends State<FilteredDonorsPage> {
  Stream _dataStream;
  doThis() async {
    setState(() {});
    _dataStream = await DataBaseMethods().dataSortingByNames(
      cityName: widget.city,
      stateName: widget.state,
      bloodGroup: widget.bloodGroup,
    );
    setState(() {});
  }

  @override
  void initState() {
    doThis();
    super.initState();
  }

  Widget dataInfoWidget() {
    return StreamBuilder(
      stream: _dataStream,
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
      appBar: AppBar(title: Text('Filtered Donors')),
      body: dataInfoWidget(),
    );
  }
}
