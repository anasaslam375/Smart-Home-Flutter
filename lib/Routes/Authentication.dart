
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home/Screens/Dashboard.dart';
import 'package:home/Screens/LoginPage.dart';

class MyAuthentication extends StatelessWidget {
  const MyAuthentication({ Key? key }) : super(key: key);
@override



  Widget build(BuildContext context) {

    try {
   final FirebaseAuth _auth =  FirebaseAuth.instance;
    if(_auth.currentUser != null)
    {
      return Dashboard();
    }else{
      return LoginPage();
    }
} catch (e) {

  return Container(
    child: Center(
      child: Text(e.toString()),
    ),
  );
}
    
  
  }
}


