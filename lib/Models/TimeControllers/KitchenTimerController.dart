import 'package:get/get.dart';

class KitchenTimerController extends GetxController {
  var light = false.obs;
  var nLight = false.obs;
  var oven = false.obs;
  var fan = false.obs;
  var socket = false.obs;

  changelightTimer() {
    if (light.isTrue) {
      light = false.obs;
    } else {
      light = true.obs;
    }
    update();
  }

  changenlightTimer() {
    if (nLight.isTrue) {
      nLight = false.obs;
    } else {
      nLight = true.obs;
    }
    update();
  }

  changefanTimer() {
    if (fan.isTrue) {
      fan = false.obs;
    } else {
      fan = true.obs;
    }
    update();
  }

  changeacTimer() {
    if (oven.isTrue) {
     oven = false.obs;
    } else {
      oven = true.obs;
    }
    update();
  }

  changesocketTimer() {
    if (socket.isTrue) {
      socket = false.obs;
    } else {
      socket = true.obs;
    }
    update();
  }
}
