import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:plasma/pages/chat.dart';
import 'package:plasma/pages/main_page.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/services/database.dart';
import 'package:plasma/utilities/const.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream _usersStream;

  doThis() async {
    setState(() {});
    _usersStream = await DataBaseMethods().getChatRooms(uid: AuthMethods.uid);
    setState(() {});
  }

  Widget listTileInfoWidget() {
    return StreamBuilder(
      stream: _usersStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Scrollbar(
                child: ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Column(
                      children: [
                        Divider(thickness: 2, height: 0),
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(
                              ds["pic"],
                              height: 50,
                              width: 50,
                            ),
                          ), //
                          title: Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 7),
                            child: Text(ds['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          subtitle: Text(ds['email']),
                          onTap: () {
                            Get.to(ChatPage(
                              pic: ds['pic'],
                              name: ds['name'],
                              email: ds['email'],
                              uid: ds['uid'],
                              chatRoom: true,
                            ));
                          },
                        ),
                        Divider(thickness: 2, height: 0),
                      ],
                    );
                  },
                ),
              )
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    doThis();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
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
      body: listTileInfoWidget(),
    );
  }
}
