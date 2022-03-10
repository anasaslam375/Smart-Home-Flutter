// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:home/Models/SliderController.dart';
import 'package:home/Screens/Dashboard.dart';
import 'package:home/Screens/Rooms/Bath.dart';
import 'package:home/Screens/Rooms/Room1.dart';
import 'package:home/Screens/Rooms/Room2.dart';
import 'package:home/Screens/Rooms/TVLunch.dart';
import 'package:home/Themes/MyThemes.dart';
import 'package:home/Widgets/Room/kitchen1.dart';
import 'package:slidable_bar/slidable_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Kitchen extends StatefulWidget {
  const Kitchen({ Key? key }) : super(key: key);

  @override
  _KitchenState createState() => _KitchenState();
}

class _KitchenState extends State<Kitchen> {
  final sliderCon = Get.put(SliderController());
  bool isCheck = false;
  final SlidableBarController controller =
      SlidableBarController(initialStatus: false);

  bool drawer = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(MyTheme.BackgroundColor),
      body: SafeArea(
          child: SlidableBar(
        backgroundColor: Color(0xfff188bfa),
        barRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        size: drawer ? 65 : MediaQuery.of(context).size.width / 1.7,
        slidableController: controller,
        side: Side.left,
        clicker: Container(
          color: Colors.white,
          height: 1,
          width: 1,
        ),
        barChildren: [
          Column(
            children: [
              drawer
                  ? Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.home,
                        size: 50,
                        color: Colors.white,
                      ).onTap(() {
                        Get.off(Dashboard());
                      }),
                    ).pOnly(left: 5, right: 5)
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        Icon(
                          Icons.home,
                          size: 50,
                          color: Colors.white,
                        ),
                        "Home"
                            .text
                            .size(20)
                            .scale(1.2)
                            .color(Colors.white)
                            .make()
                            .pOnly(left: 5)
                      ]).pOnly(left: 15),
                    ).pOnly(left: 5, right: 5).onTap(() {
                      Get.off(Dashboard());
                    }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              Divider(
                color: Colors.white,
              ),
              drawer
                  ? Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          color: sliderCon.Living.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.bedroom_child_outlined,
                        size: 50,
                        color: sliderCon.Living.value
                            ? Color(0xfff188bfa)
                            : Colors.white,
                      ).onTap(() {
                        if (sliderCon.Living.value == false) {
                          setState(() {
                             sliderCon.changeLivingStatus();
                          });
                         
                          Get.off(Room1());
                        }
                      }),
                    ).pOnly(left: 5, right: 5)
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: sliderCon.Living.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        Icon(
                          Icons.bedroom_child_outlined,
                          size: 50,
                          color: sliderCon.Living.value
                              ? Color(0xfff188bfa)
                              : Colors.white,
                        ),
                        "Living Room"
                            .text
                            .size(18)
                            .color(sliderCon.Living.value
                                ? Color(0xfff188bfa)
                                : Colors.white)
                            .make()
                            .pOnly(left: 5)
                      ]).pOnly(left: 15),
                    ).pOnly(left: 5, right: 5).onTap(()
                     {
                          if (sliderCon.Living.value == false) {
                           setState(() {
                             sliderCon.changeLivingStatus();
                           });
                            
                            Get.off(Room1());
                          }
                        }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              drawer
                  ? Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          color: sliderCon.Drawing.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.bedroom_child_outlined,
                        size: 50,
                        color: sliderCon.Drawing.value?
                             Color(0xfff188bfa):Colors.white,
                      ).onTap(() {
                        if(sliderCon.Drawing.value == false){
                          setState(() {
                            sliderCon.changeDrawingStatus();
                          });
                          
                        Get.off(Room2());}
                      }),
                    ).pOnly(left: 5, right: 5)
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: sliderCon.Drawing.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        Icon(
                          Icons.bedroom_child_outlined,
                          size: 50,
                          color: sliderCon.Drawing.value
                              ? Color(0xfff188bfa)
                              : Colors.white,
                        ),
                        "Drawing Room"
                            .text
                            .size(18)
                            .color(sliderCon.Drawing.value
                                ? Color(0xfff188bfa)
                                : Colors.white)
                            .make()
                            .pOnly(left: 5)
                      ]).pOnly(left: 15),
                    ).pOnly(left: 5, right: 5).onTap(() 
                    {
                          if(sliderCon.Drawing.value == false){
                            setState(() {
                              sliderCon.changeDrawingStatus();
                            });
                            
                        Get.off(Room2());}
                        }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              drawer
                  ? Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          color: sliderCon.TvLunch.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.tv,
                        size: 50,
                        color: sliderCon.TvLunch.value?
                             Color(0xfff188bfa):Colors.white,
                      ).onTap(() {
                        if(sliderCon.TvLunch.value == false){
                          setState(() {
                             sliderCon.changeTvLunchStatus();
                          });
                        Get.off(TVLunch());}
                      }),
                    ).pOnly(left: 5, right: 5)
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: sliderCon.TvLunch.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        Icon(
                          Icons.tv,
                          size: 50,
                          color: sliderCon.TvLunch.value
                              ? Color(0xfff188bfa)
                              : Colors.white,
                        ),
                        "TV Lunch"
                            .text
                            .size(18)
                            .color(sliderCon.TvLunch.value
                                ? Color(0xfff188bfa)
                                : Colors.white)
                            .make()
                            .pOnly(left: 5)
                      ]).pOnly(left: 15),
                    ).pOnly(left: 5, right: 5).onTap(() 
                    {
                          if(sliderCon.TvLunch.value == false){
                            setState(() {
                              sliderCon.changeTvLunchStatus();
                            }); 
                        Get.off(TVLunch());}
                        }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              drawer
                  ? Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          color: sliderCon.Kitchen.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.kitchen,
                        size: 50,
                        color: sliderCon.Kitchen.value
                            ? Color(0xfff188bfa)
                            : Colors.white,
                      ).onTap(() {
                        if(sliderCon.Kitchen.value == false){
                          setState(() {
                            
                          sliderCon.changeKitchenStatus();
                          });
                        Get.off(Kitchen());}
                      }),
                    ).pOnly(left: 5, right: 5)
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: sliderCon.Kitchen.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        Icon(
                          Icons.kitchen,
                          size: 50,
                          color: sliderCon.Kitchen.value
                              ? Color(0xfff188bfa)
                              : Colors.white,
                        ),
                        "Kitchen"
                            .text
                            .size(18)
                            .color(sliderCon.Kitchen.value
                                ? Color(0xfff188bfa)
                                : Colors.white)
                            .make()
                            .pOnly(left: 5)
                      ]).pOnly(left: 15),
                    ).pOnly(left: 5, right: 5).onTap(() 
                    {
                         if(sliderCon.Kitchen.value == false){
                           setState(() {
                             
                          sliderCon.changeKitchenStatus();
                           });
                        Get.off(Kitchen());}
                        }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              drawer
                  ? Container(
                      height: 60,
                      width: 80,
                      decoration: BoxDecoration(
                          color: sliderCon.Bath.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Icon(
                        Icons.bathroom_outlined,
                        size: 50,
                        color: sliderCon.Bath.value
                            ? Color(0xfff188bfa)
                            : Colors.white,
                      ).onTap(() {
                        if(sliderCon.Bath.value == false){
                          setState(() {
                            
                          sliderCon.changeBathStatus();
                          });
                        Get.off(Bath());}
                      }),
                    ).pOnly(left: 5, right: 5)
                  : Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: sliderCon.Bath.value ? Colors.white : null,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Row(children: [
                        Icon(
                          Icons.bathroom_outlined,
                          size: 50,
                          color: sliderCon.Bath.value
                              ? Color(0xfff188bfa)
                              : Colors.white,
                        ),
                        "Bathroom"
                            .text
                            .size(18)
                            .color(sliderCon.Bath.value
                                ? Color(0xfff188bfa)
                                : Colors.white)
                            .make()
                            .pOnly(left: 5)
                      ]).pOnly(left: 15),
                    ).pOnly(left: 5, right: 5).onTap(() 
                    {
                          if(sliderCon.Bath.value == false){
                            setState(() {
                              
                          sliderCon.changeBathStatus();
                            });
                        Get.off(Bath());}
                        }),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
              drawer
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.showToast(msg: "Done..");
                        setState(() {
                          drawer = false;
                        });
                      },
                    ).pOnly(top: MediaQuery.of(context).size.height / 12)
                  : IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.showToast(msg: "Done..");
                        setState(() {
                          drawer = true;
                        });
                      },
                    ).pOnly(top: MediaQuery.of(context).size.height / 12)
            ],
          ).pOnly(top: MediaQuery.of(context).size.height / 12)
        ],
        child: Container(
          color: Colors.grey.shade200,
          child: Column(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                              child: Image.asset(
                        "assets/images/menu.jpg",
                        height: size.height / 28,
                        width: size.height / 28,
                        fit: BoxFit.fill,
                      ).pOnly(left: 3))
                          .onTap(() {
                        controller.show();
                        setState(() {
                          isCheck = true;
                        });
                      }),
                      Expanded(child: SizedBox()),
                      "Kitchen"
                          .text
                          .size(size.height / 30)
                          .bold
                          .color(Colors.black)
                          .make()
                          .centered(),
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
                height: size.height / 1.14,
                width: size.width,
                child: isCheck
                    ? IgnorePointer(child: KitchenWidget())
                    : KitchenWidget(),
              )
            ],
          ),
        ).onTap(() {
          controller.hide();
          setState(() {
            drawer = true;
            isCheck = false;
          });
        }),
      )),
    );
  }
}