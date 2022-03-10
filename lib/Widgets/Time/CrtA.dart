import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CrtA extends StatefulWidget {
  CrtA({Key? key}) : super(key: key);

  

  @override
  _CrtAState createState() => _CrtAState();
}

class _CrtAState extends State<CrtA> {
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
        child: Text(_timeString),
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
    return DateFormat('a').format(dateTime);
  }
}