import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:home/Modules/MyFirebase.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Room1Widget extends StatefulWidget {
  const Room1Widget({Key? key}) : super(key: key);

  @override
  _Room1WidgetState createState() => _Room1WidgetState();
}

class _Room1WidgetState extends State<Room1Widget> {
  
  final MyFireBase myFireBase = new MyFireBase() ;
  bool checkTimer = false;
  static var starttime;
  static var endtime;

  void _onPress({required var size , required bool deviceStatus, required String deviceName}) {
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
                            _onPress(size: size, deviceName: deviceName, deviceStatus: deviceStatus);
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
                            _onPress(size: size, deviceName: deviceName, deviceStatus: deviceStatus);
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
                                          size: size, deviceName: deviceName, deviceStatus: deviceStatus);
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
                                          size: size, deviceName: deviceName, deviceStatus: deviceStatus);
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
                              if (deviceName == "Light") {
                                   myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  deviceStatus, 
                                                    deviceName: 'Light', 
                                                    ending:  endtime, 
                                                    starting: starttime, 
                                                    timerStatus:true
                                                    
                                                    ); 
                                   myFireBase.CounterTimerincrement(RoomName: "Living");
                                            myFireBase.CounterTimerincrement(RoomName: "Total");
                               
                              } else if (deviceName == "nLight") {
                                  myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  deviceStatus, 
                                                    deviceName: 'NLight', 
                                                    ending:  endtime, 
                                                    starting: starttime, 
                                                    timerStatus:true
                                                    
                                                    ); 
                                   myFireBase.CounterTimerincrement(RoomName: "Living");
                                            myFireBase.CounterTimerincrement(RoomName: "Total");
                              
                              } else if (deviceName == "Fan") {
                                  myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  deviceStatus, 
                                                    deviceName: 'Fan', 
                                                    ending:  endtime, 
                                                    starting: starttime, 
                                                    timerStatus:true
                                                    
                                                    ); 
                                   myFireBase.CounterTimerincrement(RoomName: "Living");
                                            myFireBase.CounterTimerincrement(RoomName: "Total");
                                
                              } else if (deviceName == "Ac") {
                                  myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  deviceStatus, 
                                                    deviceName: 'Ac', 
                                                    ending:  endtime, 
                                                    starting: starttime, 
                                                    timerStatus:true
                                                    
                                                    ); 
                                   myFireBase.CounterTimerincrement(RoomName: "Living");
                                            myFireBase.CounterTimerincrement(RoomName: "Total");
                               
                              } else if (deviceName == "Tv") {
                                  myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  deviceStatus, 
                                                    deviceName: 'Tv', 
                                                    ending:  endtime, 
                                                    starting: starttime, 
                                                    timerStatus:true
                                                    
                                                    ); 
                                   myFireBase.CounterTimerincrement(RoomName: "Living");
                                            myFireBase.CounterTimerincrement(RoomName: "Total");
                               
                              } else {}
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



  bool selectBox1 = false;
  bool selectBox2 = false;
  bool selectBox3 = false;
  bool selectBox4 = false;
  bool selectBox5 = false;
  bool selectBox6 = false;
  bool selectBox7 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
                .collection('Rooms').doc("Home").snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
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
                  Row(
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
                                          .color(selectBox1
                                              ? Colors.white
                                              : Colors.black)
                                          .scale(0.8)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: output["Living"]["Light"]["LightStatus"]
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                       myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Light', 
                                                    ending:  output["Living"]["Light"]["LightTimer"]["Ending"], 
                                                    starting: output["Living"]["Light"]["LightTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Light"]["LightTimer"]["TimerStatus"]
                                                    
                                                    );
                                                     myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                    
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                     myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Light', 
                                                    ending:  output["Living"]["Light"]["LightTimer"]["Ending"], 
                                                    starting: output["Living"]["Light"]["LightTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Light"]["LightTimer"]["TimerStatus"]
                                                    
                                                    );
                                                     myFireBase.CounterUsedincrement(RoomName: "Living");
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
                                        color: selectBox1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      Expanded(child: SizedBox()),
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      "Light"
                                          .text
                                          .color(selectBox1
                                              ? Colors.white
                                              : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                       output["Living"]["Light"]["LightTimer"]["TimerStatus"]
                                          ? Icon(
                                              Icons.timer,
                                              color: selectBox1
                                                  ? Colors.white
                                                  : Colors.black,
                                            ).onTap(() {
                                                myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  output["Living"]["Light"]["LightStatus"], 
                                                    deviceName: 'Light', 
                                                    ending: "", 
                                                    starting: "", 
                                                    timerStatus:false
                                                    
                                                    );
                                                myFireBase.CounterTimerdecrement(RoomName: "Living");
                                                myFireBase.CounterTimerdecrement(RoomName: "Total");
                                              
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox1
                                                  ? Colors.white
                                                  : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size, deviceName: "Light", deviceStatus: output["Living"]["Light"]["LightStatus"]);
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                          .onTap(() {
                        setState(() {
                          selectBox1 = true;
                          selectBox2 = selectBox3 = selectBox4 =
                              selectBox5 = selectBox6 = selectBox7 = false;
                        });
                      }),
                      SizedBox(
                        width: size.width / 32,
                      ),
                      Container(
                              height: size.height / 4.8,
                              width: size.width / 2.2,
                              decoration: selectBox2
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
                                          .color(selectBox2
                                              ? Colors.white
                                              : Colors.black)
                                          .scale(0.8)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: output["Living"]["NLight"]["NLightStatus"]
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                      myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'NLight', 
                                                    ending:  output["Living"]["NLight"]["NLightTimer"]["Ending"], 
                                                    starting: output["Living"]["NLight"]["NLightTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["NLight"]["NLightTimer"]["TimerStatus"]
                                                    
                                                    );
                                                      myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                    
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                      myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'NLight', 
                                                    ending:  output["Living"]["NLight"]["NLightTimer"]["Ending"], 
                                                    starting: output["Living"]["NLight"]["NLightTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["NLight"]["NLightTimer"]["TimerStatus"]
                                                    
                                                    );
                                                      myFireBase.CounterUsedincrement(RoomName: "Living");
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
                                        color: selectBox2
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      Expanded(child: SizedBox())
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      "Night Light"
                                          .text
                                          .color(selectBox2
                                              ? Colors.white
                                              : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                     output["Living"]["NLight"]["NLightTimer"]["TimerStatus"]
                                          ? Icon(
                                              Icons.timer,
                                              color: selectBox2
                                                  ? Colors.white
                                                  : Colors.black,
                                            ).onTap(() {
                                                myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  output["Living"]["NLight"]["NLightStatus"], 
                                                    deviceName: 'NLight', 
                                                    ending: "", 
                                                    starting: "", 
                                                    timerStatus:false
                                                    
                                                    );
                                                myFireBase.CounterTimerdecrement(RoomName: "Living");
                                                myFireBase.CounterTimerdecrement(RoomName: "Total");
                                              
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox2
                                                  ? Colors.white
                                                  : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size, deviceName: "nLight", deviceStatus: output["Living"]["NLight"]["NLightTimer"]["TimerStatus"]);
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                          .onTap(() {
                        setState(() {
                          selectBox2 = true;
                          selectBox1 = selectBox3 = selectBox4 =
                              selectBox5 = selectBox6 = selectBox7 = false;
                        });
                      }),
                    ],
                  ).pOnly(
                    bottom: size.height / 76,
                  ),
                  Row(
                    children: [
                      Container(
                              height: size.height / 4.8,
                              width: size.width / 2.2,
                             decoration: selectBox3
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
                                          .color(selectBox3
                                              ? Colors.white
                                              : Colors.black)
                                          .scale(0.8)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: output["Living"]["Ac"]["AcStatus"]
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                      myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Ac', 
                                                    ending:  output["Living"]["Ac"]["AcTimer"]["Ending"], 
                                                    starting: output["Living"]["Ac"]["AcTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Ac"]["AcTimer"]["TimerStatus"]
                                                    
                                                    );
                                                      myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                    
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                     myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Ac', 
                                                    ending:  output["Living"]["Ac"]["AcTimer"]["Ending"], 
                                                    starting: output["Living"]["Ac"]["AcTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Ac"]["AcTimer"]["TimerStatus"]
                                                    
                                                    );
                                                      myFireBase.CounterUsedincrement(RoomName: "Living");
                                                      myFireBase.CounterUsedincrement(RoomName: "Total");
                                                   
                                                  }),
                                          ))
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: selectBox3
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      Expanded(child: SizedBox())
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      "AC"
                                          .text
                                          .color(selectBox3
                                              ? Colors.white
                                              : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      output["Living"]["Ac"]["AcTimer"]["TimerStatus"]
                                          ? Icon(
                                              Icons.timer,
                                              color: selectBox3
                                                  ? Colors.white
                                                  : Colors.black,
                                            ).onTap(() {
                                                 myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  output["Living"]["Ac"]["AcStatus"], 
                                                    deviceName: 'Ac', 
                                                    ending: "", 
                                                    starting: "", 
                                                    timerStatus:false
                                                    
                                                    );
                                                myFireBase.CounterTimerdecrement(RoomName: "Living");
                                                myFireBase.CounterTimerdecrement(RoomName: "Total");
                                              
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox3
                                                  ? Colors.white
                                                  : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size, deviceName: "Ac", deviceStatus: output["Living"]["Ac"]["AcTimer"]["TimerStatus"]);
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                          .onTap(() {
                        setState(() {
                          selectBox3 = true;
                          selectBox2 = selectBox1 = selectBox4 =
                              selectBox5 = selectBox6 = selectBox7 = false;
                        });
                      }),
                      SizedBox(
                        width: size.width / 32,
                      ),
                      Container(
                                  height: size.height / 4.8,
                                  width: size.width / 2.2,
                                 decoration: selectBox4
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
                                              .color(selectBox4 ? Colors.white : Colors.black)
                                              .scale(0.8)
                                              .extraBold
                                              .make(),
                                          Expanded(child: SizedBox()),
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 20,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: output["Living"]["Fan"]["FanStatus"]
                                                    ? Image.asset(
                                                        "assets/images/SON.png",
                                                        height: size.height / 15,
                                                        width: size.height / 15,
                                                        fit: BoxFit.fill,
                                                      ).onTap(() {
                                                          myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Fan', 
                                                    ending:  output["Living"]["Fan"]["FanTimer"]["Ending"], 
                                                    starting: output["Living"]["Fan"]["FanTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Fan"]["FanTimer"]["TimerStatus"]
                                                    
                                                    );
                                                          myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                       
                                                      })
                                                    : Image.asset(
                                                        "assets/images/SOFF.png",
                                                        height: size.height / 15,
                                                        width: size.height / 15,
                                                        fit: BoxFit.fill,
                                                      ).onTap(() {
                                                          myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Fan', 
                                                    ending:  output["Living"]["Fan"]["FanTimer"]["Ending"], 
                                                    starting: output["Living"]["Fan"]["FanTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Fan"]["FanTimer"]["TimerStatus"]
                                                    
                                                    );
                                                          myFireBase.CounterUsedincrement(RoomName: "Living");
                                                      myFireBase.CounterUsedincrement(RoomName: "Total");
                                                       
                                                      }),
                                              ))
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.fan,
                                            color: selectBox4 ? Colors.white : Colors.black,
                                          ),
                                          Expanded(child: SizedBox())
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        children: [
                                          "Fan"
                                              .text
                                              .color(selectBox4 ? Colors.white : Colors.black)
                                              .scale(1.2)
                                              .extraBold
                                              .make(),
                                          Expanded(child: SizedBox()),
                                          output["Living"]["Fan"]["FanTimer"]["TimerStatus"]
                                              ? Icon(
                                                  Icons.timer,
                                                  color:selectBox4 ? Colors.white : Colors.black,
                                                ).onTap(() {
                                                     myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  output["Living"]["Fan"]["FantStatus"], 
                                                    deviceName: 'Fan', 
                                                    ending: "", 
                                                    starting: "", 
                                                    timerStatus:false
                                                    
                                                    );
                                                    myFireBase.CounterTimerdecrement(RoomName: "Living");
                                                myFireBase.CounterTimerdecrement(RoomName: "Total");
                                                
                                                })
                                              : Icon(
                                                  Icons.timer_off,
                                                  color: selectBox4 ? Colors.white : Colors.black,
                                                ).onTap(() {
                                                  _onPress(
                                                      size: size,
                                                      deviceName: "Fan", deviceStatus: output["Living"]["Fan"]["FanTimer"]["TimerStatus"]);
                                                })
                                        ],
                                      )
                                    ],
                                  ).p16())
                              .onTap(() {
                              setState(() {
                                selectBox4 = true;
                                selectBox2 = selectBox3 = selectBox1 =
                                    selectBox5 = selectBox6 = selectBox7 = false;
                              });
                            })
                    ],
                  ).pOnly(bottom: size.height / 76),
                  Row(
                    children: [
                      Container(
                                  height: size.height / 4.8,
                                  width: size.width / 2.2,
                                 decoration: selectBox5
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
                                              .color(selectBox5 ? Colors.white : Colors.black)
                                              .scale(0.8)
                                              .extraBold
                                              .make(),
                                          Expanded(child: SizedBox()),
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 20,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: output["Living"]["Tv"]["TvStatus"]
                                                    ? Image.asset(
                                                        "assets/images/SON.png",
                                                        height: size.height / 15,
                                                        width: size.height / 15,
                                                        fit: BoxFit.fill,
                                                      ).onTap(() {
                                                           myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Tv', 
                                                    ending:  output["Living"]["Tv"]["TvTimer"]["Ending"], 
                                                    starting: output["Living"]["Tv"]["TvTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Tv"]["TvTimer"]["TimerStatus"]
                                                    
                                                    );
                                                          myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                        
                                                      })
                                                    : Image.asset(
                                                        "assets/images/SOFF.png",
                                                        height: size.height / 15,
                                                        width: size.height / 15,
                                                        fit: BoxFit.fill,
                                                      ).onTap(() {
                                                          myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Tv', 
                                                    ending:  output["Living"]["Tv"]["TvTimer"]["Ending"], 
                                                    starting: output["Living"]["Tv"]["TvTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Tv"]["TvTimer"]["TimerStatus"]
                                                    
                                                    );
                                                          myFireBase.CounterUsedincrement(RoomName: "Living");
                                                      myFireBase.CounterUsedincrement(RoomName: "Total");
                                                      
                                                      }),
                                              ))
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.tv,
                                            color: selectBox5 ? Colors.white : Colors.black,
                                          ),
                                          Expanded(child: SizedBox())
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        children: [
                                          "TV"
                                              .text
                                              .color(selectBox5 ? Colors.white : Colors.black)
                                              .scale(1.2)
                                              .extraBold
                                              .make(),
                                          Expanded(child: SizedBox()),
                                          output["Living"]["Tv"]["TvTimer"]["TimerStatus"]
                                              ? Icon(
                                                  Icons.timer,
                                                  color: selectBox5 ? Colors.white : Colors.black,
                                                ).onTap(() {
                                                     myFireBase.changeTimerStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus:  output["Living"]["Tv"]["TvStatus"], 
                                                    deviceName: 'Tv', 
                                                    ending: "", 
                                                    starting: "", 
                                                    timerStatus:false
                                                    
                                                    );
                                                   myFireBase.CounterTimerdecrement(RoomName: "Living");
                                                myFireBase.CounterTimerdecrement(RoomName: "Total");
                                                 
                                                })
                                              : Icon(
                                                  Icons.timer_off,
                                                  color: selectBox5 ? Colors.white : Colors.black,
                                                ).onTap(() {
                                                  _onPress(
                                                      size: size, deviceName: "Tv", deviceStatus:  output["Living"]["Tv"]["TvTimer"]["TimerStatus"]);
                                                })
                                        ],
                                      )
                                    ],
                                  ).p16())
                              .onTap(() {
                              setState(() {
                                selectBox5 = true;
                                selectBox2 = selectBox3 = selectBox4 =
                                    selectBox1 = selectBox6 = selectBox7 = false;
                              });
                            }),
                      SizedBox(
                        width: size.width / 32,
                      ),
                      Container(
                                  height: size.height / 4.8,
                                  width: size.width / 2.2,
                                  decoration: selectBox6
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
                                              .color(selectBox6 ? Colors.white : Colors.black)
                                              .scale(0.8)
                                              .extraBold
                                              .make(),
                                          Expanded(child: SizedBox()),
                                          CircleAvatar(
                                              backgroundColor: Colors.white,
                                              radius: 20,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: output["Living"]["Charger"]["ChargerStatus"]
                                                    ? Image.asset(
                                                        "assets/images/SON.png",
                                                        height: size.height / 15,
                                                        width: size.height / 15,
                                                        fit: BoxFit.fill,
                                                      ).onTap(() {
                                                           myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Charger', 
                                                    ending:  output["Living"]["Charger"]["ChargerTimer"]["Ending"], 
                                                    starting: output["Living"]["Charger"]["ChargerTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Charger"]["ChargerTimer"]["TimerStatus"]
                                                    
                                                    );
                                                          myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                        
                                                      })
                                                    : Image.asset(
                                                        "assets/images/SOFF.png",
                                                        height: size.height / 15,
                                                        width: size.height / 15,
                                                        fit: BoxFit.fill,
                                                      ).onTap(() {
                                                           myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Charger', 
                                                    ending:  output["Living"]["Charger"]["ChargerTimer"]["Ending"], 
                                                    starting: output["Living"]["Charger"]["ChargerTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Charger"]["ChargerTimer"]["TimerStatus"]
                                                    
                                                    );
                                                          myFireBase.CounterUsedincrement(RoomName: "Living");
                                                      myFireBase.CounterUsedincrement(RoomName: "Total");
                                                       
                                                      }),
                                              ))
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.mobile,
                                            color: selectBox6 ? Colors.white : Colors.black,
                                          ),
                                          Expanded(child: SizedBox())
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Row(
                                        children: [
                                          "Mobile Charger"
                                              .text
                                              .color(selectBox6 ? Colors.white : Colors.black)
                                              .scale(1.2)
                                              .extraBold
                                              .make(),
                                          Expanded(child: SizedBox())
                                        ],
                                      )
                                    ],
                                  ).p16())
                              .onTap(() {
                              setState(() {
                                selectBox6 = true;
                                selectBox2 = selectBox3 = selectBox4 =
                                    selectBox5 = selectBox1 = selectBox7 = false;
                              });
                            })
                    ],
                  ).pOnly(bottom: size.height / 76),
                  Container(
                              height: size.height / 4.8,
                              width: size.width / 2.2,
                              decoration: selectBox7
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
                                          .color(selectBox7 ? Colors.white : Colors.black)
                                          .scale(0.8)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 20,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(50),
                                            child: output["Living"]["Socket"]["SocketStatus"]
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                       myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: false, 
                                                    deviceName: 'Socket', 
                                                    ending:  output["Living"]["Socket"]["SocketTimer"]["Ending"], 
                                                    starting: output["Living"]["Socket"]["SocketTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Socket"]["SocketTimer"]["TimerStatus"]
                                                    
                                                    );
                                                     myFireBase.CounterUseddecrement(RoomName: "Living");
                                                      myFireBase.CounterUseddecrement(RoomName: "Total");
                                                    
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height: size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                      myFireBase.changeDeviceStatus(
                                                    
                                                    RoomName: "Living", 
                                                    deviceStatus: true, 
                                                    deviceName: 'Socket', 
                                                    ending:  output["Living"]["Socket"]["SocketTimer"]["Ending"], 
                                                    starting: output["Living"]["Socket"]["SocketTimer"]["Starting"], 
                                                    timerStatus: output["Living"]["Socket"]["SocketTimer"]["TimerStatus"]
                                                    
                                                    );
                                                     myFireBase.CounterUsedincrement(RoomName: "Living");
                                                      myFireBase.CounterUsedincrement(RoomName: "Total");
                                                  
                                                  }),
                                          ))
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/socket.jpg",
                                        height: 25,
                                        width: 25,
                                      ),
                                      Expanded(child: SizedBox())
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      "socket"
                                          .text
                                          .color(selectBox7 ? Colors.white : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox())
                                    ],
                                  )
                                ],
                              ).p16())
                           .onTap(() {
                          setState(() {
                            selectBox7 = true;
                            selectBox2 = selectBox3 = selectBox4 =
                                selectBox5 = selectBox6 = selectBox1 = false;
                          });
                        }),
                ],
              ).pOnly(right: 2.5, left: 2.5),
            ),
          ).p8().whFull(context),
        );
       }
         return Center(child: Text('Something 1 wrong'));
      
      }
    );
  }
}
