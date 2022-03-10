import 'package:get/get.dart';

class BathTimerController extends GetxController {
  var light = false.obs;

  changelightTimer() {
    if (light.isTrue) {
      light = false.obs;
    } else {
      light = true.obs;
    }
    update();
  }
}
