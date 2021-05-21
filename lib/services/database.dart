import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future saveUserInfo({String userId, Map<String, dynamic> userInfoMap}) async {
    try {
      return await _firestore.collection('users').doc(userId).set(userInfoMap);
    } catch (e) {
      print(e);
    }
  }

  Future getMyInfo({String userId}) async {
    try {
      return _firestore
          .collection('users')
          .where('uid', isEqualTo: userId)
          .snapshots();
    } catch (e) {
      print(e);
    }
  }

  Future getDonorUsersInfo() async {
    try {
      return _firestore
          .collection('users')
          .where('donor', isEqualTo: true)
          .snapshots();
    } catch (e) {
      print(e);
    }
  }

  Future getPatientUsersInfo() async {
    try {
      return _firestore
          .collection('users')
          .where('donor', isEqualTo: false)
          .snapshots();
    } catch (e) {
      print(e);
    }
  }

  Future dataSortingByNames({String cityName, stateName, bloodGroup}) async {
    try {
      return _firestore
          .collection('users')
          .where('donor', isEqualTo: true)
          .where('stateName', isEqualTo: stateName)
          .where('cityName', isEqualTo: cityName)
          .where('bloodGroup', isEqualTo: bloodGroup)
          .snapshots();
    } catch (e) {
      print(e);
    }
  }

  Future dataSortingByPinCode({String pinCode}) async {
    try {
      return _firestore
          .collection('users')
          .where('donor', isEqualTo: true)
          .where('pinCode', isEqualTo: pinCode)
          .snapshots();
    } catch (e) {
      print(e);
    }
  }

  Future saveMyChatRooms({String uid, gmail, Map map}) async {
    return await _firestore
        .collection('chats')
        .doc(uid)
        .collection('chatRooms')
        .doc(gmail)
        .set(map);
  }

  Future saveOtherChatRooms({String uid, gmail, Map map}) async {
    return await _firestore
        .collection('chats')
        .doc(uid)
        .collection('chatRooms')
        .doc(gmail)
        .set(map);
  }

  Future getChatRooms({String uid}) async {
    return _firestore
        .collection('chats')
        .doc(uid)
        .collection('chatRooms')
        .snapshots();
  }

  Future saveMyChats({String uid, gmail, Map map}) async {
    return await _firestore
        .collection('chats')
        .doc(uid)
        .collection('chatRooms')
        .doc(gmail)
        .collection('chat')
        .add(map);
  }

  Future saveOtherChats({String uid, gmail, Map map}) async {
    return await _firestore
        .collection('chats')
        .doc(uid)
        .collection('chatRooms')
        .doc(gmail)
        .collection('chat')
        .add(map);
  }

  getChats({String uid, gmail}) async {
    return _firestore
        .collection('chats')
        .doc(uid)
        .collection('chatRooms')
        .doc(gmail)
        .collection('chat')
        .orderBy('lastMessageTS', descending: true)
        .snapshots();
  }
}
