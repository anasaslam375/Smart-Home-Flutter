// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, use_full_hex_values_for_flutter_colors, sized_box_for_whitespace, prefer_final_fields, non_constant_identifier_names, unused_local_variable



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Screens/Dashboard.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController UserID = TextEditingController();
  TextEditingController Password = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static bool visiblity=true;
  
  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Column(
              children: [
                Container(
                        height: size.height/2.3,
                        child: Image.asset("assets/images/logo.jpg"))
                    .pOnly(top: size.height/25),
                TextFormField(
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Enter UserID..";
                    }
                  },
                  controller: UserID,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: "User ID",
                    prefixIcon: Icon(Icons.account_box, color: Colors.black),
                  ),
                ).pOnly(top: size.height/20, bottom: size.height/60),
                TextFormField(
                  obscureText: visiblity,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Enter Password..";
                    }
                   else if (input.length < 6) {
                      return "Password must be atleast 6 letters..";
                    }
                  },
                  controller: Password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock, color: Colors.black),
                    suffixIcon: GestureDetector(onTap: (){
                      setState(() {
                        visiblity=!visiblity;
                      });
                    }, 
                    child: visiblity? Icon(Icons.visibility, color: Colors.black)
                    :Icon(Icons.visibility_off, color: Colors.black),) ,
                  ),
                ),
                Container(
                  child: "Login".text.extraBold.scale(1.5).make().centered(),
                  height: size.height/12,
                  decoration: const BoxDecoration(
                      color: Color(0xfff049ee9),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      )),
                ).pOnly(top: size.height/30, left: 70,right: 70).wFull(context).onTap(() async {
                  if(_globalKey.currentState!.validate())
                  {

                    try{
                      await auth.signInWithEmailAndPassword(email: UserID.text, password: Password.text).then((value) => Get.off(Dashboard()));

                    }catch(e){
                      context.showToast(msg: "Invalid User..");
                    }

                    
                   
                  }
                })
              ],
            ).p16(),
          ),
        ),
      ),
    );
  }
}
