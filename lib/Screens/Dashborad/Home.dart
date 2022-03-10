// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/Models/SliderController.dart';
import 'package:home/Screens/Rooms/Bath.dart';
import 'package:home/Screens/Rooms/Kitchen.dart';
import 'package:home/Screens/Rooms/Room1.dart';
import 'package:home/Screens/Rooms/Room2.dart';
import 'package:home/Screens/Rooms/TVLunch.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Contrl = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
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
                  Contrl.changeLivingStatus();
                  Get.to( Room1());
                }),
                SizedBox(
                  width: size.width / 42,
                ),
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
                  Contrl.changeDrawingStatus();
                  Get.to( Room2());
                }),
              ],
            ).pOnly(bottom: size.height / 89),
            Row(
              children: [
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
                  Contrl.changeTvLunchStatus();
                  Get.to(TVLunch());
                }),
                SizedBox(
                  width: size.width / 42,
                ),
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
                  Contrl.changeKitchenStatus();
                  Get.to( Kitchen());
                }),
              ],
            ).pOnly(bottom: size.height / 89),
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
                Contrl.changeBathStatus();
                  Get.to(Bath());
                }),
          ],
        ).p12(),
      ),
    );
  }
}
