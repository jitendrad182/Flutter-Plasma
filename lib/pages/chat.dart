import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plasma/services/auth.dart';
import 'package:plasma/services/database.dart';
import 'package:plasma/utilities/const.dart';
import 'package:plasma/widgets/main_user_message.dart';
import 'package:plasma/widgets/other_user_message.dart';
import 'package:plasma/widgets/reusable_textformfield_widget.dart';

class ChatPage extends StatefulWidget {
  final String name, pic, email, uid;
  final bool chatRoom;
  ChatPage({this.name, this.pic, this.email, this.uid, this.chatRoom});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Stream _stream;
  final messageTextEditingController = TextEditingController();
  final _focusNode = FocusNode();
  String chat;
  bool chatRoom() {
    return widget.chatRoom;
  }

  bool chatRoomOrNot;
  Widget messages() {
    return StreamBuilder(
      stream: _stream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                reverse: true,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];

                  return ds['email'] == AuthMethods.email
                      ? MainUserMessage(message: ds['message'])
                      : OtherUserMessage(message: ds['message']);
                },
              )
            : Center();
      },
    );
  }

  getAndSetMessage() async {
    if (messageTextEditingController.text != '') {
      setState(() {
        chat = messageTextEditingController.text;
      });

      if (chatRoomOrNot == false) {
        Map<String, dynamic> myMap = {
          'name': widget.name,
          'email': widget.email,
          'pic': widget.pic,
          'uid': widget.uid,
        };
        Map<String, dynamic> map = {
          'name': AuthMethods.name,
          'email': AuthMethods.email,
          'pic': AuthMethods.pic,
          'uid': AuthMethods.uid,
        };
        await DataBaseMethods().saveMyChatRooms(
            uid: AuthMethods.uid, gmail: widget.email, map: myMap);
        await DataBaseMethods().saveOtherChatRooms(
            uid: widget.uid, gmail: AuthMethods.email, map: map);
      }
      var lastMessageTS = DateTime.now();
      Map<String, dynamic> myMessageInfoMap = {
        'message': chat,
        'lastMessageTS': lastMessageTS,
        'email': AuthMethods.email,
      };
      setState(() {
        chatRoomOrNot = true;
      });
      messageTextEditingController.clear();

      await DataBaseMethods().saveMyChats(
          uid: AuthMethods.uid, gmail: widget.email, map: myMessageInfoMap);
      await DataBaseMethods().saveOtherChats(
          uid: widget.uid, gmail: AuthMethods.email, map: myMessageInfoMap);

      setState(() {});
      _stream = await DataBaseMethods()
          .getChats(uid: AuthMethods.uid, gmail: widget.email);
      setState(() {});
    }
  }

  doThis() async {
    setState(() {});
    _stream = await DataBaseMethods()
        .getChats(uid: AuthMethods.uid, gmail: widget.email);
    setState(() {});
  }

  @override
  void initState() {
    doThis();
    chatRoomOrNot = chatRoom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                widget.pic,
                height: 40,
                width: 40,
              ),
            ),
            SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: messages(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ReusableTextFormField(
              iconData: Icons.chat,
              keyboardType: TextInputType.name,
              validator: (val) {},
              hintText: 'Type a message',
              focusNode: _focusNode,
              controller: messageTextEditingController,
              suffixIcon: IconButton(
                icon: Icon(Icons.send, color: kButtonColor),
                splashRadius: 25,
                onPressed: () {
                  getAndSetMessage();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
