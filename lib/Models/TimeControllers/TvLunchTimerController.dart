import 'package:get/get.dart';

class TvLunchTimerController extends GetxController {
  var light = false.obs;
  var nLight = false.obs;
  var ac = false.obs;
  var fan = false.obs;
  var tv = false.obs;
  var charger = false.obs;
  var iron = false.obs;
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
    if (ac.isTrue) {
      ac = false.obs;
    } else {
      ac = true.obs;
    }
    update();
  }

  changetvTimer() {
    if (tv.isTrue) {
      tv = false.obs;
    } else {
      tv = true.obs;
    }
    update();
  }
}
