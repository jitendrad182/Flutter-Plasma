import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plasma/pages/main_page.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _signIn = GoogleSignIn();
  static String email, name, pic, uid;

  Future signOut() async {
    try {
      await _signIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future getCurrentUser() async {
    try {
      User user = _auth.currentUser;
      email = user.email;
      name = user.displayName;
      pic = user.photoURL;
      uid = user.uid;
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount account = await _signIn.signIn();
      final GoogleSignInAuthentication authentication =
          await account.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User user = userCredential.user;
      if (userCredential != null) {
        email = user.email;
        name = user.displayName;
        pic = user.photoURL;
        uid = user.uid;
        Get.offAll(MainPage());
      }
    } catch (e) {
      print(e);
    }
  }
}
