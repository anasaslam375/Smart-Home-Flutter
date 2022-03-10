// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Modules/SplashScreen.dart';
import 'package:home/Routes/Authentication.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //             title: "Blood Donation",
    //             debugShowCheckedModeBanner: false,
    //             theme: ThemeData(fontFamily: 'Facit'),             
    //             home: Dashboard(),
    //             // initialRoute: MyRoutes.RouteAuth,
    //             routes: {
    //               // "/": (context) => Myauth(),
    //                MyRoutes.RouteDashboard: (context) => Dashboard(),
    //               MyRoutes.RouteLogin: (context) => LoginPage(),
    //             });
     try {
      return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GetMaterialApp(
                debugShowCheckedModeBanner: false, home: SplashScreen());
          } else { 
            return GetMaterialApp(
                title: "Smart Home",
                debugShowCheckedModeBanner: false,
                //theme: ThemeData(fontFamily: 'Facit'),
                home: MyAuthentication(),
                // initialRoute: MyRoutes.RouteAuth,
                routes: {
                  // "/": (context) => Myauth(),
                 
                });
          }
        },
      );
    } catch (e) {
      return Container(
        child: Text(e.toString()),
      );
    }
  }
}