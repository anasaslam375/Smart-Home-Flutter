import 'package:get/get.dart';

class CounterTimer extends GetxController{
  var totalTimers =0.obs;
  var livingTimers=0.obs;
  var drawingTimers=0.obs;
  var tvlunchTimers=0.obs;
  var kitchenTimers=0.obs;
  var bathTimers=0.obs;

  incrementtotalTimer(){
    totalTimers++;
  }
  decrementtotalTimer(){
    totalTimers--;
  }

  incrementlivingTimer(){
    livingTimers++;
  }
  decrementlivingTimer(){
    livingTimers--;
  }

  incrementdrawingTimers(){
    drawingTimers++;
  }
  decrementdrawingTimers(){
    drawingTimers--;
  }

  incrementtvlunchTimers(){
    tvlunchTimers++;
  }
  decrementtvlunchTimers(){
    tvlunchTimers--;
  }

  incrementkitchenTimers(){
    kitchenTimers++;
  }
  decrementkitchenTimers(){
    kitchenTimers--;
  }

  incrementbathTimers(){
    bathTimers++;
  }
  decrementbathTimers(){
    bathTimers--;
  }

}