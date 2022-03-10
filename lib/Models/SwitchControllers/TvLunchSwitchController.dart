import 'package:get/get.dart';

class TvLunchSwitchController extends GetxController {
  var light = false.obs;
  var nLight = false.obs;
  var ac = false.obs;
  var fan = false.obs;
  var tv = false.obs;
  var charger = false.obs;
  var iron = false.obs;
  var socket = false.obs;

  changelightStatus() {
    if (light.isTrue) {
      light = false.obs;
       update();
    } else {
      light = true.obs;
       update();
    }
   
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
    if (ac.isTrue) {
      ac = false.obs;
    } else {
      ac = true.obs;
    }
    update();
  }

  changetvStatus() {
    if (tv.isTrue) {
      tv = false.obs;
    } else {
      tv = true.obs;
    }
    update();
  }

  changechargerStatus() {
    if (charger.isTrue) {
      charger = false.obs;
    } else {
      charger = true.obs;
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

  changeironStatus() {
    if (iron.isTrue) {
      iron = false.obs;
    } else {
      iron = true.obs;
    }
    update();
  }
}
