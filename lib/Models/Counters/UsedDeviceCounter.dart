
// ignore_for_file: file_names



import 'package:get/get.dart';

class CounterUsed extends GetxController{
  
  var totalUsed=0.obs;
  var livingUsed=0.obs;
  var drawingUsed=0.obs;
  var tvlunchUsed=0.obs;
  var kitchenUsed=0.obs;
  var bathUsed=0.obs;

  incrementtotalUsed(){
    totalUsed++;
  }
  decrementtotalUsed(){
    totalUsed--;
  }

  incrementlivingUsed(){
    livingUsed++;
  }
  decrementlivingUsed(){
    livingUsed--;
  }

  incrementdrawingUsed(){
    drawingUsed++;
  }
  decrementdrawingUsed(){
    drawingUsed--;
  }

  incrementtvlunchUsed(){
    tvlunchUsed++;
  }
  decrementtvlunchUsed(){
    tvlunchUsed--;
  }

  incrementkitchenUsed(){
    kitchenUsed++;
  }
  decrementkitchenUsed(){
    kitchenUsed--;
  }

  incrementbathUsed(){
    bathUsed++;
  }
  decrementbathUsed(){
    bathUsed--;
  }

  void decrementtvlunchTimers() {}


}