// ignore_for_file: prefer_const_constructors

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Models/Counters/TimerDeviceCounters.dart';
import 'package:home/Models/Counters/UsedDeviceCounter.dart';
import 'package:home/Models/SwitchControllers/KitchenSwitchController.dart';
import 'package:home/Models/TimeControllers/KitchenTimerController.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KitchenWidget extends StatefulWidget {
  const KitchenWidget({Key? key}) : super(key: key);

  @override
  _KitchenWidgetState createState() => _KitchenWidgetState();
}

class _KitchenWidgetState extends State<KitchenWidget> {
  bool checkTimer = false;
  static var starttime;
  static var endtime;

  void _onPress({required var size, required int deviceName}) {
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
                                        size: size, deviceName: deviceName);
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
                                          size: size, deviceName: deviceName);
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
                                          size: size, deviceName: deviceName);
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
                                            size: size, deviceName: deviceName);
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
                              if (deviceName == 1) {
                                setState(() {
                                  KitchenTimerCon.changelightTimer();
                                  counterTimer.incrementtotalTimer();
                                  counterTimer.incrementkitchenTimers();
                                });
                              } else if (deviceName == 2) {
                                setState(() {
                                  KitchenTimerCon.changenlightTimer();
                                  counterTimer.incrementtotalTimer();
                                  counterTimer.incrementkitchenTimers();
                                });
                              } else if (deviceName == 3) {
                                setState(() {
                                  KitchenTimerCon.changefanTimer();
                                  counterTimer.incrementtotalTimer();
                                  counterTimer.incrementkitchenTimers();
                                });
                              } else if (deviceName == 4) {
                                setState(() {
                                  KitchenTimerCon.changeacTimer();
                                  counterTimer.incrementtotalTimer();
                                  counterTimer.incrementkitchenTimers();
                                });
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

  final KitchenSwitchCon = Get.put(KitchenSwitchController());
  final KitchenTimerCon = Get.put(KitchenTimerController());
  final counterTimer = Get.put(CounterTimer());
  final counterUsed = Get.put(CounterUsed());

  bool selectBox1 = false;
  bool selectBox2 = false;
  bool selectBox3 = false;
  bool selectBox4 = false;
  bool selectBox5 = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      child: SingleChildScrollView(
        child: Column(children: [
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
                                    child: KitchenSwitchCon.light.value
                                        ? Image.asset(
                                            "assets/images/SON.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changelightStatus();
                                              counterUsed
                                                  .decrementkitchenUsed();
                                              counterUsed.decrementtotalUsed();
                                            });
                                          })
                                        : Image.asset(
                                            "assets/images/SOFF.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changelightStatus();
                                              counterUsed
                                                  .incrementkitchenUsed();
                                              counterUsed.incrementtotalUsed();
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
                                  .color(
                                      selectBox1 ? Colors.white : Colors.black)
                                  .scale(1.2)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              KitchenTimerCon.light.value
                                  ? Icon(
                                      Icons.timer,
                                      color: selectBox1
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      setState(() {
                                        KitchenTimerCon.changelightTimer();
                                        counterTimer.decrementtotalTimer();
                                        counterTimer.decrementkitchenTimers();
                                      });
                                    })
                                  : Icon(
                                      Icons.timer_off,
                                      color: selectBox1
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      _onPress(size: size, deviceName: 1);
                                    })
                            ],
                          )
                        ],
                      ).p16())
                  .onTap(() {
                setState(() {
                  selectBox1 = true;
                  selectBox2 = selectBox3 = selectBox4 = selectBox5 = false;
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
                                  .color(
                                      selectBox2 ? Colors.white : Colors.black)
                                  .scale(0.8)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: KitchenSwitchCon.nLight.value
                                        ? Image.asset(
                                            "assets/images/SON.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changenlightStatus();
                                              counterUsed
                                                  .decrementkitchenUsed();
                                              counterUsed.decrementtotalUsed();
                                            });
                                          })
                                        : Image.asset(
                                            "assets/images/SOFF.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changenlightStatus();
                                              counterUsed
                                                  .incrementkitchenUsed();
                                              counterUsed.incrementtotalUsed();
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
                                  .color(
                                      selectBox2 ? Colors.white : Colors.black)
                                  .scale(1.2)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              KitchenTimerCon.nLight.value
                                  ? Icon(
                                      Icons.timer,
                                      color: selectBox2
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      setState(() {
                                        KitchenTimerCon.changenlightTimer();
                                        counterTimer.decrementtotalTimer();
                                        counterTimer.decrementkitchenTimers();
                                      });
                                    })
                                  : Icon(
                                      Icons.timer_off,
                                      color: selectBox2
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      _onPress(
                                          size: size, deviceName: 2);
                                    })
                            ],
                          )
                        ],
                      ).p16())
                  .onTap(() {
                setState(() {
                  selectBox2 = true;
                  selectBox1 = selectBox3 = selectBox4 = selectBox5 = false;
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
                                  .color(
                                      selectBox3 ? Colors.white : Colors.black)
                                  .scale(0.8)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: KitchenSwitchCon.oven.value
                                        ? Image.asset(
                                            "assets/images/SON.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon.changeacStatus();
                                              counterUsed
                                                  .decrementkitchenUsed();
                                              counterUsed.decrementtotalUsed();
                                            });
                                          })
                                        : Image.asset(
                                            "assets/images/SOFF.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon.changeacStatus();
                                              counterUsed
                                                  .incrementkitchenUsed();
                                              counterUsed.incrementtotalUsed();
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
                              "Oven"
                                  .text
                                  .color(
                                      selectBox3 ? Colors.white : Colors.black)
                                  .scale(1.2)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              KitchenTimerCon.oven.value
                                  ? Icon(
                                      Icons.timer,
                                      color: selectBox3
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      setState(() {
                                        KitchenTimerCon.changeacTimer();
                                        counterTimer.decrementtotalTimer();
                                        counterTimer.decrementkitchenTimers();
                                      });
                                    })
                                  : Icon(
                                      Icons.timer_off,
                                      color: selectBox3
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      _onPress(size: size, deviceName: 4);
                                    })
                            ],
                          )
                        ],
                      ).p16())
                  .onTap(() {
                setState(() {
                  selectBox3 = true;
                  selectBox2 = selectBox1 = selectBox4 = selectBox5 = false;
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
                                  .color(
                                      selectBox4 ? Colors.white : Colors.black)
                                  .scale(0.8)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: KitchenSwitchCon.fan.value
                                        ? Image.asset(
                                            "assets/images/SON.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changefanStatus();
                                              counterUsed
                                                  .decrementkitchenUsed();
                                              counterUsed.decrementtotalUsed();
                                            });
                                          })
                                        : Image.asset(
                                            "assets/images/SOFF.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changefanStatus();
                                              counterUsed
                                                  .incrementkitchenUsed();
                                              counterUsed.incrementtotalUsed();
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
                                  .color(
                                      selectBox4 ? Colors.white : Colors.black)
                                  .scale(1.2)
                                  .extraBold
                                  .make(),
                              Expanded(child: SizedBox()),
                              KitchenTimerCon.fan.value
                                  ? Icon(
                                      Icons.timer,
                                      color: selectBox4
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      setState(() {
                                        KitchenTimerCon.changefanTimer();
                                        counterTimer.decrementtotalTimer();
                                        counterTimer.decrementkitchenTimers();
                                      });
                                    })
                                  : Icon(
                                      Icons.timer_off,
                                      color: selectBox4
                                          ? Colors.white
                                          : Colors.black,
                                    ).onTap(() {
                                      _onPress(size: size, deviceName: 3);
                                    })
                            ],
                          )
                        ],
                      ).p16())
                  .onTap(() {
                setState(() {
                  selectBox4 = true;
                  selectBox2 = selectBox3 = selectBox1 = selectBox5 = false;
                });
              })
            ],
          ).pOnly(bottom: size.height / 76),
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
                                    borderRadius: BorderRadius.circular(50),
                                    child: KitchenSwitchCon.socket.value
                                        ? Image.asset(
                                            "assets/images/SON.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changesocketStatus();
                                              counterUsed
                                                  .decrementkitchenUsed();
                                              counterUsed.decrementtotalUsed();
                                            });
                                          })
                                        : Image.asset(
                                            "assets/images/SOFF.png",
                                            height: size.height / 15,
                                            width: size.height / 15,
                                            fit: BoxFit.fill,
                                          ).onTap(() {
                                            setState(() {
                                              KitchenSwitchCon
                                                  .changesocketStatus();
                                              counterUsed
                                                  .incrementkitchenUsed();
                                              counterUsed.incrementtotalUsed();
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
                              "Iron"
                                  .text
                                  .color(selectBox5 ? Colors.white : Colors.black)
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
                    selectBox5 = true;
                    selectBox2 = selectBox3 =
                        selectBox4 = selectBox1 = false;
                  });
                  })
              
        ]),
      ).p8().whFull(context),
    ));
  }
}
