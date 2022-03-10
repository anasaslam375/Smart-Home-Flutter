// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Models/Counters/UsedDeviceCounter.dart';
import 'package:home/Screens/Rooms/Bath.dart';
import 'package:home/Screens/Rooms/Kitchen.dart';
import 'package:home/Screens/Rooms/Room1.dart';
import 'package:home/Screens/Rooms/Room2.dart';
import 'package:home/Screens/Rooms/TVLunch.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:badges/badges.dart';

class Used extends StatefulWidget {
  const Used({Key? key}) : super(key: key);

  @override
  _UsedState createState() => _UsedState();
}

class _UsedState extends State<Used> {
  @override
 final counterUsed = Get.put(CounterUsed());

  bool CounterUL(){
    if(counterUsed.livingUsed == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterUD(){
    if(counterUsed.drawingUsed == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterUT(){
    if(counterUsed.tvlunchUsed == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterUK(){
    if(counterUsed.kitchenUsed == 0)
    {
      return false;
    }
    else
    return true;
  }
  bool CounterUB(){
    if(counterUsed.bathUsed == 0)
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
                CounterUL()? 
                Badge(
                  badgeContent: Text("${counterUsed.livingUsed}",style: TextStyle(color: Colors.white),),
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
                    Get.off(Room1());
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
                     Get.off(Room1());
                  }),

                SizedBox(
                  width: size.width / 42,
                ),
                CounterUD()?
                Badge(
                  badgeContent: Text("${counterUsed.drawingUsed}",style: TextStyle(color: Colors.white),),
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
                    Get.off(Room2());
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
                     Get.off(Room2());
                  }),
              ],
            ).pOnly(bottom: size.height / 89),
            Row(
              children: [
                CounterUT()?
                 Badge(
                  badgeContent: Text("${counterUsed.tvlunchUsed}",style: TextStyle(color: Colors.white),),
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
                     Get.off(TVLunch());
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
                    Get.off(TVLunch());
                  }),

                SizedBox(
                  width: size.width / 42,
                ),

                CounterUK()?
                 Badge(
                  badgeContent: Text("${counterUsed.kitchenUsed}",style: TextStyle(color: Colors.white),),
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
                    Get.off(Kitchen());
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
                     Get.off(Kitchen());
                  }),
              ],
            ).pOnly(bottom: size.height / 89),

            CounterUB()?
             Badge(
                  badgeContent: Text("${counterUsed.bathUsed}",style: TextStyle(color: Colors.white),),
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
                    Get.off(Bath());
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
                    Get.off(Bath());
                  }),
          ],
        ).p12(),
      ),
    );
  }
}
