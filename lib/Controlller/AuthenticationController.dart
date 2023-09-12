import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walletwise/Utils/Fluttertoast.dart';
import 'package:walletwise/Views/DashboardScreens/DashboardScreen.dart';
import 'package:walletwise/Views/AuthenticationScreens/SignInScreen.dart';

class AuthController{
  final auth = FirebaseAuth.instance;
  Future<void> signIn(String email , String password , BuildContext context) async {
    await auth.signInWithEmailAndPassword(email: email, password: password).then((value){
      Utils().successMessage('Sign in Successful');
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const DashboardScreen()), (Route<dynamic> route) => false);
    }).onError((error, stackTrace){
      Utils().errorMessage(error.toString());
    });
  }

  Future<void> signUp(String email , String password , BuildContext context) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password).then((value){
      Utils().successMessage('Sign up Successful');
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInScreen()), (Route<dynamic> route) => false);
    }).onError((error, stackTrace){
      Utils().errorMessage(error.toString());
    });
  }

  Future<void> forgotPassword(String email , BuildContext context) async {
    await auth.sendPasswordResetEmail(email: email).then((value){
      Utils().successMessage('Please check your email');
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInScreen()), (Route<dynamic> route) => false);
    }).onError((error, stackTrace){
      Utils().errorMessage(error.toString());
    });
  }

  Future<void> signOut(BuildContext context)async {
    auth.signOut().then((value){
      Utils().successMessage('Sign out Successful');
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const SignInScreen()), (Route<dynamic> route) => false);
    }).onError((error, stackTrace){
      Utils().errorMessage(error.toString());
    });
  }
}