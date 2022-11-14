import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign/Pages/home_page.dart';
import 'package:google_sign/Pages/login_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{
  //  1) handleAuthState()
  handleAuthState(){
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
      if(snapshot.hasData){
        return HomePage();
      }else{
        return LoginPage();
      }
    },);
  }

  // 2) SignInWithGoogle()
  signInWithGoogle()async{
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>['email']).signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );
        
      // Once signed in , return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  // 3) SignOut()
    SignOut(){
      FirebaseAuth.instance.signOut();
    }

}  