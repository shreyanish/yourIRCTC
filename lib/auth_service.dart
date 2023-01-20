import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourirctc/views/search_form2.dart';
import 'login.dart';

class AuthService{
  handleAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const SearchForm();
          } else {
            return const LoginPage();
          }
        });
  }


  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

  getProfileImage() {
    if(FirebaseAuth.instance.currentUser?.photoURL != null) {
      return Image.network(FirebaseAuth.instance.currentUser?.photoURL ?? '', height: 125, width: 125,).image;
    } else {
      return const Icon(Icons.account_circle, size: 125);
    }
  }

  getProfileImageS() {
    if(FirebaseAuth.instance.currentUser?.photoURL != null) {
      return Image.network(FirebaseAuth.instance.currentUser?.photoURL ?? '', height: 50, width: 50,);
    } else {
      return const Icon(Icons.account_circle, size: 50);
    }
  }

}