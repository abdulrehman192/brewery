import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'common.dart';

class FirebaseUtility {
  static final _auth = FirebaseAuth.instance;

  static signInWithEmailPassword({required String email, required String password, required BuildContext context}) async
  {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }
    on FirebaseAuthException catch(e)
    {
      if(e.code == 'user-disabled')
      {
        Common.showSnackBar('Given email has been disabled', context);
      }
      else if(e.code == 'wrong-password')
      {
        Common.showSnackBar('Wrong Password', context);
      }
      else if(e.code == 'invalid-email')
      {
        Common.showSnackBar('Invalid Email', context);
      }
      else if(e.code == 'user-not-found')
      {
        Common.showSnackBar('No Account Registered against this email', context);
      }
    }
  }
  static signUpWithEmailPassword({required String email, required String password, required BuildContext context}) async
  {
    try
    {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null)
        {
          return userCredential.user;
        }
      else
        {
          return null;
        }
    }
    on FirebaseAuthException catch(e)
    {
      if(e.code == 'email-already-in-use')
      {
        signInWithEmailPassword(email: email, password: password,context: context);
      }
      else if(e.code == 'weak-password')
      {
        Common.showSnackBar('Password is too weak', context);
      }
      else if(e.code == 'invalid-email')
      {
        Common.showSnackBar('Invalid Email', context);
      }
      else if(e.code == 'operation-not-allowed')
      {
        Common.showSnackBar('email/password accounts are not enabled', context);
      }
    }
  }

  static sendVerificationEmail({required String? email,required BuildContext context}) async
  {
    var user =  _auth.currentUser;
    if(user != null && user.emailVerified == false)
    {
      Common.showSnackBar('A Verification email sent! please check your inbox', context);
      await user.sendEmailVerification();
    }
  }
}
