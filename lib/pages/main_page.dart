import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plasma/pages/chatroom.dart';
import 'package:plasma/pages/data_sorting_page.dart';
import 'package:plasma/pages/register_page.dart';
import 'package:plasma/pages/viewdonors.dart';
import 'package:plasma/pages/viewpa.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/card.dart';
import 'package:plasma/widgets/drawer.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kMainPageAppBar,
      drawer: KDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ReusableCard(
            iconData: Icons.text_fields,
            text: 'Registration Form',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ),
              );
            },
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  iconData: Icons.person,
                  text: 'View Donors',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewDonors(),
                      ),
                    );
                  },
                ),
                ReusableCard(
                  iconData: Icons.person,
                  text: 'View Patients',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewPatients(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                ReusableCard(
                  iconData: Icons.filter_list_sharp,
                  text: 'Filters',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DataSortingPage(),
                      ),
                    );
                  },
                ),
                ReusableCard(
                  iconData: Icons.chat,
                  text: 'Chat',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatRoom(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
