// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:home/Models/Counters/TimerDeviceCounters.dart';
import 'package:home/Models/Counters/UsedDeviceCounter.dart';
import 'package:home/Modules/MyFirebase.dart';
import 'package:home/Themes/MyThemes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BathWidget extends StatefulWidget {
  const BathWidget({Key? key}) : super(key: key);

  @override
  _BathWidgetState createState() => _BathWidgetState();
}

class _BathWidgetState extends State<BathWidget> {
  bool checkTimer = false;
  static var starttime;
  static var endtime;

  void _onPress({required var size, required bool deviceStatus , required String deviceName}) {
    late AwesomeDialog dialog;
    dialog = AwesomeDialog(
      context: context,
      animType: AnimType.SCALE,
      dialogType: DialogType.QUESTION,
      keyboardAware: true,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              'Set Timer',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 10,
            ),
            Material(
                elevation: 0,
                child: Row(
                  children: [
                    Text(
                      "Starting Time : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    checkTimer && starttime != null
                        ? Text(
                            "${starttime}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        : Text(""),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          dialog.dismiss();
                          final DateTime now = DateTime.now();
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(
                                      hour: now.hour, minute: now.minute))
                              .then((TimeOfDay? value) {
                            starttime = value!.format(context);
                            checkTimer = true;
                            setState(() {});
                            _onPress(size: size, deviceName: "Light", deviceStatus: deviceStatus);
                            context.showToast(msg: value.format(context));
                          });
                        },
                        child: Icon(Icons.timer))
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Material(
                elevation: 0,
                child: Row(
                  children: [
                    Text(
                      "Ending Time : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: SizedBox()),
                    checkTimer && endtime != null
                        ? Text(
                            "${endtime}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        : Text(""),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          dialog.dismiss();
                          final DateTime now = DateTime.now();
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(
                                      hour: now.hour, minute: now.minute))
                              .then((TimeOfDay? value) {
                            setState(() {
                              endtime = value!.format(context);
                              checkTimer = true;
                            });
                            _onPress(size: size, deviceName: "Light" , deviceStatus: deviceStatus);
                            context.showToast(msg: value!.format(context));
                          });
                        },
                        child: Icon(Icons.timer))
                  ],
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  AnimatedButton(
                      width: size.width / 3.4,
                      color: Colors.redAccent,
                      isFixedHeight: false,
                      text: 'Cancel',
                      pressEvent: () {
                        dialog.dismiss();
                      }),
                  Expanded(child: SizedBox()),
                  AnimatedButton(
                      width: size.width / 3.4,
                      color: Colors.greenAccent[400],
                      isFixedHeight: false,
                      text: 'Ok',
                      pressEvent: () {
                        if (starttime == null && endtime == null) {
                          dialog.dismiss();
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  title: 'Error',
                                  desc:
                                      'Please Enter Starting & Ending Time...!!!',
                                  btnOkOnPress: () {
                                    _onPress(
                                        size: size, deviceName: deviceName, deviceStatus: deviceStatus);
                                  },
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red)
                              .show();
                        } else {
                          if (starttime == null) {
                            dialog.dismiss();
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.RIGHSLIDE,
                                    headerAnimationLoop: true,
                                    title: 'Error',
                                    desc: 'Please Enter Starting Time...!!!',
                                    btnOkOnPress: () {
                                      _onPress(
                                          size: size, deviceName: deviceName , deviceStatus: deviceStatus);
                                    },
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.red)
                                .show();
                          } else if (endtime == null) {
                            dialog.dismiss();
                            AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.ERROR,
                                    animType: AnimType.RIGHSLIDE,
                                    headerAnimationLoop: true,
                                    title: 'Error',
                                    desc: 'Please Enter Ending Time...!!!',
                                    btnOkOnPress: () {
                                      _onPress(
                                          size: size, deviceName: deviceName,deviceStatus: deviceStatus);
                                    },
                                    btnOkIcon: Icons.cancel,
                                    btnOkColor: Colors.red)
                                .show();
                          } else {
                            if (starttime == endtime) {
                              dialog.dismiss();
                              AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.ERROR,
                                      animType: AnimType.RIGHSLIDE,
                                      headerAnimationLoop: true,
                                      title: 'Error',
                                      desc: 'Invalid Ending Time...!!!',
                                      btnOkOnPress: () {
                                        _onPress(
                                            size: size, deviceName: deviceName, deviceStatus: deviceStatus);
                                      },
                                      btnOkIcon: Icons.cancel,
                                      btnOkColor: Colors.red)
                                  .show();
                            } else {
                              dialog.dismiss();
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.LEFTSLIDE,
                                headerAnimationLoop: false,
                                dialogType: DialogType.SUCCES,
                                showCloseIcon: true,
                                title: 'Success',
                                desc: 'Thank You..!!!',
                                autoHide: Duration(seconds: 3),
                              )..show();

                               myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Bath", 
                                                    deviceStatus:  deviceStatus, 
                                                    deviceName: 'Light', 
                                                    ending:  endtime, 
                                                    starting: starttime, 
                                                    timerStatus:true
                                                    
                                                    ); 
                                            myFireBase.CounterTimerincrement(RoomName: "Bath");
                                            myFireBase.CounterTimerincrement(RoomName: "Total");

                              starttime = endtime = null;
                            }
                          }
                        }
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    )..show();
  }

  final MyFireBase myFireBase = new MyFireBase() ;
  bool selectBox1 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream:  FirebaseFirestore.instance
                .collection('Rooms').doc("Home").snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>  snapshot) {
        if (snapshot.hasError) {
          return Text('Connection Error...!!!');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);
        }
        var output = snapshot.data!.data();
         if (snapshot.hasData && output!=null) {
           
        return Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                          height: size.height / 4.8,
                          width: size.width / 2.2,
                          decoration: selectBox1
                              ? BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Color(0xfff1069bd),
                                        Color(0xfff188bfa)
                                      ]),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ))
                              : BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  "Switch"
                                      .text
                                      .color(
                                          selectBox1 ? Colors.white : Colors.black)
                                      .scale(0.8)
                                      .extraBold
                                      .make(),
                                  Expanded(child: SizedBox()),
                                  CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 20,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: 
                                        output["Bath"]["Light"]["LightStatus"]
                                            ? Image.asset(
                                                "assets/images/SON.png",
                                                height: size.height / 15,
                                                width: size.height / 15,
                                                fit: BoxFit.fill,
                                              ).onTap(() {
                                                  myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Bath", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Light', 
                                                    ending:  output["Bath"]["Light"]["LightTimer"]["Ending"], 
                                                    starting: output["Bath"]["Light"]["LightTimer"]["Starting"], 
                                                    timerStatus: output["Bath"]["Light"]["LightTimer"]["TimerStatus"]
                                                    
                                                    );
                                                  myFireBase.CounterUseddecrement(RoomName: "Bath");
                                                  myFireBase.CounterUseddecrement(RoomName: "Total");                                              
                                              })
                                            : Image.asset(
                                                "assets/images/SOFF.png",
                                                height: size.height / 15,
                                                width: size.height / 15,
                                                fit: BoxFit.fill,
                                              ).onTap(() {
                                                  myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Bath", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Light', 
                                                    ending:  output["Bath"]["Light"]["LightTimer"]["Ending"], 
                                                    starting: output["Bath"]["Light"]["LightTimer"]["Starting"], 
                                                    timerStatus: output["Bath"]["Light"]["LightTimer"]["TimerStatus"]
                                                    
                                                    );
                                                  myFireBase.CounterUsedincrement(RoomName: "Bath");
                                                  myFireBase.CounterUsedincrement(RoomName: "Total");
                                                
                                              }),
                                      ))
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  Icon(
                                    Icons.lightbulb_outline,
                                    color: selectBox1 ? Colors.white : Colors.black,
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  "Light"
                                      .text
                                      .color(
                                          selectBox1 ? Colors.white : Colors.black)
                                      .scale(1.2)
                                      .extraBold
                                      .make(),
                                  Expanded(child: SizedBox()),
                                  output["Bath"]["Light"]["LightTimer"]["TimerStatus"]
                                      ? Icon(
                                          Icons.timer,
                                          color: selectBox1
                                              ? Colors.white
                                              : Colors.black,
                                        ).onTap(() {
                                             myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Bath", 
                                                    deviceStatus:  output["Bath"]["Light"]["LightStatus"], 
                                                    deviceName: 'Light', 
                                                    ending: "", 
                                                    starting: "", 
                                                    timerStatus:false
                                                    
                                                    );
                                            myFireBase.CounterTimerdecrement(RoomName: "Bath");
                                            myFireBase.CounterTimerdecrement(RoomName: "Total");
                                        })
                                      : Icon(
                                          Icons.timer_off,
                                          color: selectBox1
                                              ? Colors.white
                                              : Colors.black,
                                        ).onTap(() {
                                          _onPress(size: size, deviceName: "Light", deviceStatus: output["Bath"]["Light"]["LightStatus"]);
                                        })
                                ],
                              )
                            ],
                          ).p16())
                      .onTap(() {
                    if (selectBox1 == false) {
                      setState(() {
                        selectBox1 = true;
                      });
                    }
                  }).pOnly(right: 2.5, left: 2.5)
                ],
              ),
            ),
          ).p8().whFull(context),
        );
         }
         return Center(child: Text('Something 1 wrong'));
      }
    );
  }
}
