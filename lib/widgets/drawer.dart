import 'package:flutter/material.dart';
import 'package:plasma/pages/about.dart';
import 'package:plasma/pages/profile.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/services/functions.dart';
import 'package:plasma/utilities/const.dart';

class KDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: kMainColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: Image.asset(
                    'assets/images/ju.png',
                    height: 80,
                    width: 80,
                  ),
                ),
                Text(
                  'PLASMA',
                  style: TextStyle(fontSize: 18, fontFamily: 'Pacifico'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Home', style: TextStyle(fontSize: 16)),
            leading: Icon(Icons.home, color: Colors.black),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Profile', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.person, color: Colors.black),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfile(
                    name: AuthMethods.name,
                    pic: AuthMethods.pic,
                    email: AuthMethods.email,
                    uid: AuthMethods.uid,
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text('About Us', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.info_sharp, color: Colors.black),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
          ListTile(
            title: Text('Log Out', style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.exit_to_app, color: Colors.black),
            onTap: () {
              Functions().signMeOut(context);
            },
          )
        ],
      ),
    );
  }
}
