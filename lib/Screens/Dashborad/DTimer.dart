// ignore_for_file: file_names

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Models/Counters/TimerDeviceCounters.dart';
import 'package:home/Screens/Rooms/Kitchen.dart';
import 'package:home/Screens/Rooms/Room1.dart';
import 'package:home/Screens/Rooms/Room2.dart';
import 'package:home/Screens/Rooms/TVLunch.dart';
import 'package:velocity_x/velocity_x.dart';

class DTimer extends StatefulWidget {
  const DTimer({Key? key}) : super(key: key);

  @override
  _DTimerState createState() => _DTimerState();
}

class _DTimerState extends State<DTimer> {
  
 final counterTimer = Get.put(CounterTimer());

 bool CounterTL(){
    if(counterTimer.livingTimers == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterTD(){
    if(counterTimer.drawingTimers == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterTT(){
    if(counterTimer.tvlunchTimers == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterTK(){
    if(counterTimer.kitchenTimers == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterTB(){
    if(counterTimer.bathTimers == 0)
    {
      return false;
    }
    else
    return true;
  }


  Widget build(BuildContext context) {
   
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CounterTL()? 
                Badge(
                  badgeContent: Text("${counterTimer.livingTimers}",style: TextStyle(color: Colors.white),),
                  badgeColor: Colors.lightBlue,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "Living Room"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.bedroom_child_outlined,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Room1()),
                    );
                  }),
                ) 
                :
                Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "Living Room"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.bedroom_child_outlined,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Room1()),
                    );
                  }),

                SizedBox(
                  width: size.width / 42,
                ),
                CounterTD()?
                Badge(
                  badgeContent: Text("${counterTimer.drawingTimers}",style: TextStyle(color: Colors.white),),
                  badgeColor: Colors.lightBlue,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "Drawing Room"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.bedroom_child_outlined,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Room2()),
                    );
                  }),
                )
                :
                Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "Drawing Room"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.bedroom_child_outlined,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Room2()),
                    );
                  }),
              ],
            ).pOnly(bottom: size.height / 89),
            Row(
              children: [
                CounterTT()?
                 Badge(
                  badgeContent: Text("${counterTimer.tvlunchTimers}",style: TextStyle(color: Colors.white),),
                  badgeColor: Colors.lightBlue,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "TV Lunch"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.tv_outlined,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TVLunch()),
                    );
                  }),
                )
                :
                 Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "TV Lunch"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.tv_outlined,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TVLunch()),
                    );
                  }),

                SizedBox(
                  width: size.width / 42,
                ),

                CounterTK()?
                 Badge(
                  badgeContent: Text("${counterTimer.kitchenTimers}",style: TextStyle(color: Colors.white),),
                  badgeColor: Colors.lightBlue,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "Kitchen"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.kitchen,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Kitchen()),
                    );
                  }),
                )
                :
                Container(
                    height: size.height / 5,
                    width: size.width / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        "Kitchen"
                            .text
                            .bold
                            .scale(1.2)
                            .make()
                            .pOnly(bottom: size.height / 60),
                        Icon(
                          Icons.kitchen,
                          size: size.height / 9,
                        )
                      ],
                    ).p12(),
                  ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Kitchen()),
                    );
                  }),
              ],
            ).pOnly(bottom: size.height / 89),

            CounterTB()?
             Badge(
                  badgeContent: Text("${counterTimer.bathTimers}",style: TextStyle(color: Colors.white),),
                  badgeColor: Colors.lightBlue,
              child: Container(
                height: size.height / 5,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    "Bath"
                        .text
                        .bold
                        .scale(1.2)
                        .make()
                        .pOnly(bottom: size.height / 60),
                    Icon(
                      Icons.bathroom_outlined,
                      size: size.height / 9,
                    )
                  ],
                ).p12(),
              ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Room1()),
                    );
                  }),
            )
            :
            Container(
                height: size.height / 5,
                width: size.width / 2.2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    "Bath"
                        .text
                        .bold
                        .scale(1.2)
                        .make()
                        .pOnly(bottom: size.height / 60),
                    Icon(
                      Icons.bathroom_outlined,
                      size: size.height / 9,
                    )
                  ],
                ).p12(),
              ).onTap(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Room1()),
                    );
                  }),
          ],
        ).p12(),
      ),
    );
  }
}
