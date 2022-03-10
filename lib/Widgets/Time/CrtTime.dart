// ignore_for_file: file_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CrtTime extends StatefulWidget {
  CrtTime({Key? key}) : super(key: key);

  

  @override
  _CrtTimeState createState() => _CrtTimeState();
}

class _CrtTimeState extends State<CrtTime> {
  late String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Center(
        child: Text(_timeString , style: TextStyle(fontSize:  30),),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('kk:mm:ss').format(dateTime);
  }
}