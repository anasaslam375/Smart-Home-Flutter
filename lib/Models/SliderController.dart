import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class SliderController extends GetxController {
  var Living = false.obs;
  var Drawing = false.obs;
  var TvLunch = false.obs;
  var Kitchen = false.obs;
  var Bath = false.obs;

  changeLivingStatus() {
    Living = true.obs;
    Drawing = false.obs;
    TvLunch = false.obs;
    Kitchen = false.obs;
    Bath = false.obs;
    update();
  }

  changeTvLunchStatus() {
    Living = false.obs;
    Drawing = false.obs;
    TvLunch = true.obs;
    Kitchen = false.obs;
    Bath = false.obs;
    update();
  }

  changeDrawingStatus() {
    Living = false.obs;
    Drawing = true.obs;
    TvLunch = false.obs;
    Kitchen = false.obs;
    Bath = false.obs;
    update();
  }

  changeKitchenStatus() {
    Living = false.obs;
    Drawing = false.obs;
    TvLunch = false.obs;
    Kitchen = true.obs;
    Bath = false.obs;
    update();
  }

  changeBathStatus() {
    Living = false.obs;
    Drawing = false.obs;
    TvLunch = false.obs;
    Kitchen = false.obs;
    Bath = true.obs;
    update();
  }
}
