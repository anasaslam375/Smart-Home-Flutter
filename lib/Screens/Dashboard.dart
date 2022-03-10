// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Models/Counters/TimerDeviceCounters.dart';
import 'package:home/Models/Counters/UsedDeviceCounter.dart';
import 'package:home/Screens/Dashborad/Home.dart';
import 'package:home/Screens/Dashborad/DTimer.dart';
import 'package:home/Screens/Dashborad/Used.dart';
import 'package:home/Screens/LoginPage.dart';
import 'package:home/Themes/MyThemes.dart';
import 'package:motion_tab_bar_v2/motion-badge.widget.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final counterTimer = Get.put(CounterTimer());
  final counterUsed = Get.put(CounterUsed());
  TabController? _tabController;
  
  bool CounterT() {
    if (counterTimer.totalTimers == 0) {
      return false;
    } else
      return true;
  }

  bool CounterU() {
    if (counterUsed.totalUsed == 0) {
      return false;
    } else
      return true;
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  bool MainSwitch = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize:
        //       Size.fromHeight(size.height / 10), // here the desired height
        //   child: Container(
        //     decoration: const BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.only(
        //             bottomLeft: Radius.circular(30),
        //             bottomRight: Radius.circular(30))),
        //     child: Row(
        //       children: [
        //         Image.asset(
        //           "assets/images/playstore.png",
        //           height: size.height / 15,
        //           width: size.height / 15,
        //           fit: BoxFit.fill,
        //         ),
        //         "Smart Home".text.extraBold.size(25).make().pOnly(left: 5),
        //         Expanded(child: SizedBox()),
        //         CircleAvatar(
        //             backgroundColor: Colors.white,
        //             radius: 20,
        //             child: ClipRRect(
        //               borderRadius: BorderRadius.circular(50),
        //               child: Image.asset(
        //                 "assets/images/splash.png",
        //                 height: size.height / 15,
        //                 width: size.height / 15,
        //                 fit: BoxFit.fill,
        //               ),
        //             ))
        //       ],
        //     ).centered().p12().pOnly(top: size.height / 30),
        //   ).wFull(context),
        // ),
        backgroundColor: Color(MyTheme.BackgroundColor),
        bottomNavigationBar: MotionTabBar(
          initialSelectedTab: "Home",
          labels: const ["Home", "Timer", "Used"],
          icons: const [Icons.home, Icons.timer, Icons.data_usage_rounded],
    
          badges: [
            null,
            // Default Motion Badge Widget
            CounterT()
                ? MotionBadgeWidget(
                    text: "${counterTimer.totalTimers}",
                    textColor: Colors.white, // optional, default to Colors.white
                    color: Colors.lightBlue, // optional, default to Colors.red
                    size: 18, // optional, default to 18
                  )
                : null,
    
            // custom badge Widget
            CounterU()
                ? MotionBadgeWidget(
                    text: "${counterUsed.totalUsed}",
                    textColor: Colors.white, // optional, default to Colors.white
                    color: Colors.lightBlue, // optional, default to Colors.red
                    size: 18, // optional, default to 18
                  )
                : null,
          ],
    
          // optional badges, length must be same with labels
          tabSize: size.height / 17.9,
          tabBarHeight: size.height / 16,
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          tabIconColor: Color(0xfff31a3f4),
          tabIconSize: size.height / 27,
          tabIconSelectedSize: size.height / 30,
          tabSelectedColor: Color(0xfff31a3f4),
          tabIconSelectedColor: Colors.white,
          tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              _tabController!.index = value;
            });
          },
        ),
        body: Column(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))),
                height: size.height / 13,
                width: size.width,
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/playstore.png",
                        height: size.height / 19,
                        width: size.height / 19,
                        fit: BoxFit.fill,
                      ),
                    ).pOnly(left: 3),
                     SizedBox(width: 5,),
                    "Smart Home".text.extraBold.size(25).make().pOnly(left: 5),
                    Expanded(child: SizedBox()),
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            "assets/images/splash.png",
                            height: size.height / 15,
                            width: size.height / 15,
                            fit: BoxFit.fill,
                          ),
                        )).pOnly(right: 3)
                  ],
                )),
            Container(
                height: size.height / 5,
                width: size.width,
                // color: Colors.green,
                child: Row(
                  children: [
                    Column(
                      children: [
                        DigitalClock(
                         // digitAnimationStyle: Curves.elasticOut,
                          is24HourTimeFormat: false,
                          hourMinuteDigitDecoration: BoxDecoration(
                              border: Border.fromBorderSide(BorderSide.none),
                              borderRadius: BorderRadius.circular(5)),
                          secondDigitDecoration: BoxDecoration(
                              border: Border.fromBorderSide(BorderSide.none),
                              borderRadius: BorderRadius.circular(5)),
                          areaDecoration: BoxDecoration(
                            color: Color(MyTheme.BackgroundColor),
                          ),
                          hourMinuteDigitTextStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 25,
                          ),
                          amPmDigitTextStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xfff1d1c21),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          height: size.height / 7,
                          width: size.width / 8,
                          child: MainSwitch
                              ? Image.asset("assets/images/ON.jpg")
                                  .p8()
                                  .onTap(() async {
                                  await FirebaseAuth.instance.signOut();
                                    Get.off(LoginPage());
                                  setState(() {
                                     
                                    MainSwitch = false;
                                  });
                                })
                              : Image.asset("assets/images/OFF.jpg")
                                  .p8()
                                  .onTap(() {
                                  setState(() {
                                    MainSwitch = true;
                                  });
                                }),
                        ),
                        "Main Switch".text.scale(.8).make().pOnly(top: 4)
                      ],
                    )
                  ],
                ).p8().pOnly(top: 3)),
            Container(
              height: size.height / 14,
              width: size.width,
              child: "Rooms"
                  .text
                  .size(size.height / 30)
                  .bold
                  .color(Colors.black)
                  .make()
                  .centered(),
            ),
            Container(
              height: size.height / 1.906,
              width: size.width,
              child: TabBarView(
                physics:
                    NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
                controller: _tabController,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Center(
                    child: Home(),
                  ),
                  const Center(
                    child: DTimer(),
                  ),
                  const Center(
                    child: Used(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
