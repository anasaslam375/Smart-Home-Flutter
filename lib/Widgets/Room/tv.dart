import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Models/Counters/TimerDeviceCounters.dart';
import 'package:home/Models/Counters/UsedDeviceCounter.dart';
import 'package:home/Models/SwitchControllers/TvLunchSwitchController.dart';
import 'package:home/Models/TimeControllers/TvLunchTimerController.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TVLunchWidget extends StatefulWidget {
  const TVLunchWidget({ Key? key }) : super(key: key);

  @override
  _TVLunchWidgetState createState() => _TVLunchWidgetState();
}

class _TVLunchWidgetState extends State<TVLunchWidget> {
  bool checkTimer = false;
  static var starttime;
  static var endtime;

  void _onPress({required var size, required String deviceName}) {
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
                    checkTimer && starttime!=null
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
                            _onPress(size: size, deviceName: deviceName);
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
                            _onPress(size: size, deviceName: deviceName);
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
                        if (starttime == null && endtime== null) {
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
                                        size: size, deviceName: deviceName);
                                  },
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red)
                              .show();
                        } else {
                          if(starttime == null){
                            dialog.dismiss();
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  title: 'Error',
                                  desc:
                                      'Please Enter Starting Time...!!!',
                                  btnOkOnPress: () {
                                    _onPress(
                                        size: size, deviceName: deviceName);
                                  },
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red)
                              .show();
                          }else if( endtime == null){
                            dialog.dismiss();
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  title: 'Error',
                                  desc:
                                      'Please Enter Ending Time...!!!',
                                  btnOkOnPress: () {
                                    _onPress(
                                        size: size, deviceName: deviceName);
                                  },
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red)
                              .show();
                          }else{
                             if(starttime == endtime){
                               dialog.dismiss();
                          AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.RIGHSLIDE,
                                  headerAnimationLoop: true,
                                  title: 'Error',
                                  desc:
                                      'Invalid Ending Time...!!!',
                                  btnOkOnPress: () {
                                    _onPress(
                                        size: size, deviceName: deviceName);
                                  },
                                  btnOkIcon: Icons.cancel,
                                  btnOkColor: Colors.red)
                              .show();
                             }else{
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
                            setState(() {
                              TvLunchTimerCon.changelightTimer();
                              counterTimer.incrementtotalTimer();
                              counterTimer.incrementtvlunchTimers();
                            });
                          } else if (deviceName == "nLight") {
                            setState(() {
                              TvLunchTimerCon.changenlightTimer();
                              counterTimer.incrementtotalTimer();
                              counterTimer.incrementtvlunchTimers();
                            });
                          } else if (deviceName == "Fan") {
                            setState(() {
                              TvLunchTimerCon.changefanTimer();
                              counterTimer.incrementtotalTimer();
                              counterTimer.incrementtvlunchTimers();
                            });
                          } else if (deviceName == "Ac") {
                            setState(() {
                              TvLunchTimerCon.changeacTimer();
                              counterTimer.incrementtotalTimer();
                              counterTimer.incrementtvlunchTimers();
                            });
                          } else if (deviceName == "Tv") {
                            setState(() {
                              TvLunchTimerCon.changetvTimer();
                              counterTimer.incrementtotalTimer();
                              counterTimer.incrementtvlunchTimers();
                            });
                          } else {}
                          starttime=endtime=null;
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

  final TvLunchSwitchCon = Get.put(TvLunchSwitchController());
  final TvLunchTimerCon = Get.put(TvLunchTimerController());
  final counterTimer = Get.put(CounterTimer());
  final counterUsed = Get.put(CounterUsed());

  bool selectBox1 = false;
  bool selectBox2 = false;
  bool selectBox3 = false;
  bool selectBox4 = false;
  bool selectBox5 = false;
  bool selectBox6 = false;
  bool selectBox7 = false;
  bool selectBox8 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                                          .color(selectBox1 ? Colors.white : Colors.black)
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
                                            child: TvLunchSwitchCon.light.value
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changelightStatus();
                                                      counterUsed
                                                          .decrementtvlunchUsed();
                                                      counterUsed
                                                          .decrementtotalUsed();
                                                    });
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changelightStatus();
                                                      counterUsed
                                                          .incrementtvlunchUsed();
                                                      counterUsed
                                                          .incrementtotalUsed();
                                                    });
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
                                          .color(selectBox1 ? Colors.white : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      TvLunchTimerCon.light.value
                                          ? Icon(
                                              Icons.timer,
                                              color:selectBox1 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              setState(() {
                                                TvLunchTimerCon
                                                    .changelightTimer();
                                                counterTimer
                                                    .decrementtotalTimer();
                                                counterTimer
                                                    .decrementtvlunchTimers();
                                              });
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox1 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size,
                                                  deviceName: "Light");
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                          .onTap(() {
                          setState(() {
                            selectBox1 = true;
                            selectBox2 = selectBox3 = selectBox4 =
                                selectBox5 =
                                    selectBox6 = selectBox7= selectBox8 = false;
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
                                          .color(selectBox2 ? Colors.white : Colors.black)
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
                                            child: TvLunchSwitchCon
                                                    .nLight.value
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changenlightStatus();
                                                      counterUsed
                                                          .decrementtvlunchUsed();
                                                      counterUsed
                                                          .decrementtotalUsed();
                                                    });
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changenlightStatus();
                                                      counterUsed
                                                          .incrementtvlunchUsed();
                                                      counterUsed
                                                          .incrementtotalUsed();
                                                    });
                                                  }),
                                          ))
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.lightbulb_outline,
                                        color: selectBox2 ? Colors.white : Colors.black,
                                      ),
                                      Expanded(child: SizedBox())
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      "Night Light"
                                          .text
                                          .color(selectBox2 ? Colors.white : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      TvLunchTimerCon.nLight.value
                                          ? Icon(
                                              Icons.timer,
                                              color: selectBox2 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              setState(() {
                                                TvLunchTimerCon
                                                    .changenlightTimer();
                                                counterTimer
                                                    .decrementtotalTimer();
                                                counterTimer
                                                    .decrementtvlunchTimers();
                                              });
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox2 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size,
                                                  deviceName: "nLight");
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                          .onTap(() {
                          setState(() {
                            selectBox2 = true;
                            selectBox1 = selectBox3 = selectBox4 =
                                selectBox5 =
                                    selectBox6 = selectBox7= selectBox8 = false;
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
                                          .color(selectBox3 ? Colors.white : Colors.black)
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
                                            child: TvLunchSwitchCon.ac.value
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changeacStatus();
                                                      counterUsed
                                                          .decrementtvlunchUsed();
                                                      counterUsed
                                                          .decrementtotalUsed();
                                                    });
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changeacStatus();
                                                      counterUsed
                                                          .incrementtvlunchUsed();
                                                      counterUsed
                                                          .incrementtotalUsed();
                                                    });
                                                  }),
                                          ))
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.ac_unit,
                                        color: selectBox3 ? Colors.white : Colors.black,
                                      ),
                                      Expanded(child: SizedBox())
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      "AC"
                                          .text
                                          .color(selectBox3 ? Colors.white : Colors.black)
                                          .scale(1.2)
                                          .extraBold
                                          .make(),
                                      Expanded(child: SizedBox()),
                                      TvLunchTimerCon.ac.value
                                          ? Icon(
                                              Icons.timer,
                                              color:selectBox3 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              setState(() {
                                                TvLunchTimerCon
                                                    .changeacTimer();
                                                counterTimer
                                                    .decrementtotalTimer();
                                                counterTimer
                                                    .decrementtvlunchTimers();
                                              });
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox3 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size,
                                                  deviceName: "Ac");
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                           .onTap(() {
                          setState(() {
                            selectBox3 = true;
                            selectBox2 = selectBox1 = selectBox4 =
                                selectBox5 =
                                    selectBox6 = selectBox7= selectBox8 = false;
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
                                          .color(selectBox4? Colors.white : Colors.black)
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
                                            child: TvLunchSwitchCon.fan.value
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changefanStatus();
                                                      counterUsed
                                                          .decrementtvlunchUsed();
                                                      counterUsed
                                                          .decrementtotalUsed();
                                                    });
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changefanStatus();
                                                      counterUsed
                                                          .incrementtvlunchUsed();
                                                      counterUsed
                                                          .incrementtotalUsed();
                                                    });
                                                  }),
                                          ))
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.fan,
                                        color: selectBox4? Colors.white : Colors.black,
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
                                      TvLunchTimerCon.fan.value
                                          ? Icon(
                                              Icons.timer,
                                              color: selectBox4 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              setState(() {
                                                TvLunchTimerCon
                                                    .changefanTimer();
                                                counterTimer
                                                    .decrementtotalTimer();
                                                counterTimer
                                                    .decrementtvlunchTimers();
                                              });
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox4 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size,
                                                  deviceName: "Fan");
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                         .onTap(() {
                          setState(() {
                            selectBox4 = true;
                            selectBox2 = selectBox3 = selectBox1 =
                                selectBox5 =
                                    selectBox6 = selectBox7= selectBox8 = false;
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
                                            child: TvLunchSwitchCon.tv.value
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changetvStatus();
                                                      counterUsed
                                                          .decrementtvlunchUsed();
                                                      counterUsed
                                                          .decrementtotalUsed();
                                                    });
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changetvStatus();
                                                      counterUsed
                                                          .incrementtvlunchUsed();
                                                      counterUsed
                                                          .incrementtotalUsed();
                                                    });
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
                                      TvLunchTimerCon.tv.value
                                          ? Icon(
                                              Icons.timer,
                                              color: selectBox5 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              setState(() {
                                                TvLunchTimerCon
                                                    .changetvTimer();
                                                counterTimer
                                                    .decrementtotalTimer();
                                                counterTimer
                                                    .decrementtvlunchTimers();
                                              });
                                            })
                                          : Icon(
                                              Icons.timer_off,
                                              color: selectBox5 ? Colors.white : Colors.black,
                                            ).onTap(() {
                                              _onPress(
                                                  size: size,
                                                  deviceName: "Tv");
                                            })
                                    ],
                                  )
                                ],
                              ).p16())
                          .onTap(() {
                          setState(() {
                            selectBox5 = true;
                            selectBox2 = selectBox3 = selectBox4 =
                                selectBox1 =
                                    selectBox6 = selectBox7= selectBox8 = false;
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
                                            child: TvLunchSwitchCon
                                                    .charger.value
                                                ? Image.asset(
                                                    "assets/images/SON.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changechargerStatus();
                                                      counterUsed
                                                          .decrementtvlunchUsed();
                                                      counterUsed
                                                          .decrementtotalUsed();
                                                    });
                                                  })
                                                : Image.asset(
                                                    "assets/images/SOFF.png",
                                                    height:
                                                        size.height / 15,
                                                    width: size.height / 15,
                                                    fit: BoxFit.fill,
                                                  ).onTap(() {
                                                    setState(() {
                                                      TvLunchSwitchCon
                                                          .changechargerStatus();
                                                      counterUsed
                                                          .incrementtvlunchUsed();
                                                      counterUsed
                                                          .incrementtotalUsed();
                                                    });
                                                  }),
                                          ))
                                    ],
                                  ),
                                  Expanded(child: SizedBox()),
                                  Row(
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.mobile,
                                        color:selectBox6 ? Colors.white : Colors.black,
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
                                selectBox5 =
                                    selectBox1 = selectBox7 = selectBox8 = false;
                          });
                        })
                ],
              ).pOnly(bottom: size.height / 76),
              Row(
                children: [
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
                                        borderRadius:
                                            BorderRadius.circular(50),
                                        child: TvLunchSwitchCon.iron.value
                                            ? Image.asset(
                                                "assets/images/SON.png",
                                                height: size.height / 15,
                                                width: size.height / 15,
                                                fit: BoxFit.fill,
                                              ).onTap(() {
                                                setState(() {
                                                  TvLunchSwitchCon
                                                      .changeironStatus();
                                                  counterUsed
                                                      .decrementtvlunchUsed();
                                                  counterUsed
                                                      .decrementtotalUsed();
                                                });
                                              })
                                            : Image.asset(
                                                "assets/images/SOFF.png",
                                                height: size.height / 15,
                                                width: size.height / 15,
                                                fit: BoxFit.fill,
                                              ).onTap(() {
                                                setState(() {
                                                  TvLunchSwitchCon
                                                      .changeironStatus();
                                                  counterUsed
                                                      .incrementtvlunchUsed();
                                                  counterUsed
                                                      .incrementtotalUsed();
                                                });
                                              }),
                                      ))
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  Icon(
                                    Icons.iron,
                                    color: selectBox7 ? Colors.white : Colors.black,
                                  ),
                                  Expanded(child: SizedBox())
                                ],
                              ),
                              Expanded(child: SizedBox()),
                              Row(
                                children: [
                                  "Iron"
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
            
                  SizedBox(
                    width: size.width / 32,
                  ),
                   Container(
                          height: size.height / 4.8,
                          width: size.width / 2.2,
                         decoration: selectBox8
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
                                      .color(selectBox8 ? Colors.white : Colors.black)
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
                                        child: TvLunchSwitchCon.socket.value
                                            ? Image.asset(
                                                "assets/images/SON.png",
                                                height: size.height / 15,
                                                width: size.height / 15,
                                                fit: BoxFit.fill,
                                              ).onTap(() {
                                                setState(() {
                                                  TvLunchSwitchCon
                                                      .changesocketStatus();
                                                  counterUsed
                                                      .decrementtvlunchUsed();
                                                  counterUsed
                                                      .decrementtotalUsed();
                                                });
                                              })
                                            : Image.asset(
                                                "assets/images/SOFF.png",
                                                height: size.height / 15,
                                                width: size.height / 15,
                                                fit: BoxFit.fill,
                                              ).onTap(() {
                                                setState(() {
                                                  TvLunchSwitchCon
                                                      .changesocketStatus();
                                                  counterUsed
                                                      .incrementtvlunchUsed();
                                                  counterUsed
                                                      .incrementtotalUsed();
                                                });
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
                                  "Socket"
                                      .text
                                      .color(selectBox8? Colors.white : Colors.black)
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
                        selectBox8 = true;
                        selectBox2 = selectBox3 = selectBox4 =
                            selectBox5 = selectBox6=selectBox7 = selectBox1 = false;
                      });
                    }),
            
                ],
              ).pOnly(bottom: size.height / 76),
             ],
          ).pOnly(right: 2.5, left: 2.5),
        ),
      ).p8().whFull(context),
    );
  }
}
