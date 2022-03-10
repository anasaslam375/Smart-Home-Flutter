import 'package:get/get.dart';

class KitchenSwitchController extends GetxController {
  var light = false.obs;
  var nLight = false.obs;
  var oven = false.obs;
  var fan = false.obs;
  var socket = false.obs;

  changelightStatus() {
    if (light.isTrue) {
      light = false.obs;
    } else {
      light = true.obs;
    }
    update();
  }

  changenlightStatus() {
    if (nLight.isTrue) {
      nLight = false.obs;
    } else {
      nLight = true.obs;
    }
    update();
  }

  changefanStatus() {
    if (fan.isTrue) {
      fan = false.obs;
    } else {
      fan = true.obs;
    }
    update();
  }

  changeacStatus() {
    if (oven.isTrue) {
     oven = false.obs;
    } else {
      oven = true.obs;
    }
    update();
  }

  changesocketStatus() {
    if (socket.isTrue) {
      socket = false.obs;
    } else {
      socket = true.obs;
    }
    update();
  }
}
