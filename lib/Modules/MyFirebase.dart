
// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class MyFireBase{
  Future<void> changeDeviceStatus({
      
      required String RoomName , 
      required String deviceName , 
      required bool deviceStatus , 
      required bool timerStatus ,
      required String starting , 
      required String ending
      
      }) {
    return FirebaseFirestore.instance.collection("Rooms")
    .doc('Home')
    .update(
      {'${RoomName}': 
        {"${deviceName}":
          {"${deviceName}Status": deviceStatus ,
            "${deviceName}Timer": 
              {"TimerStatus": timerStatus,
                "Starting": starting,
                "Ending": ending
               }}}})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future<void> CounterUsedincrement({required String RoomName}) {
    return FirebaseFirestore.instance.collection("Rooms")
    .doc('UsedCounter')
    .update({"${RoomName}": FieldValue.increment(1)})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future<void> CounterUseddecrement({required String RoomName }) {
    return FirebaseFirestore.instance.collection("Rooms")
    .doc('UsedCounter')
    .update({"${RoomName}": FieldValue.increment(-1)})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  

  Future<void> changeTimerStatus({
      
      required String RoomName , 
      required String deviceName , 
      required bool deviceStatus , 
      required bool timerStatus ,
      required String starting , 
      required String ending
      
      }) {
    return FirebaseFirestore.instance.collection("Rooms")
    .doc('Home')
    .update(
      {'${RoomName}': 
        {"${deviceName}":
          {"${deviceName}Status": deviceStatus ,
            "${deviceName}Timer": 
              {"TimerStatus": timerStatus,
                "Starting": starting,
                "Ending": ending
               }}}})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
   
  Future<void> CounterTimerincrement({required String RoomName }) {
    return FirebaseFirestore.instance.collection("Rooms")
    .doc('TimerCounter')
    .update({"${RoomName}":FieldValue.increment(1)})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }
  Future<void> CounterTimerdecrement({required String RoomName }) {
    return FirebaseFirestore.instance.collection("Rooms")
    .doc('TimerCounter')
    .update({"${RoomName}":FieldValue.increment(-1)})
    .then((value) => print("User Updated"))
    .catchError((error) => print("Failed to update user: $error"));
  }

}