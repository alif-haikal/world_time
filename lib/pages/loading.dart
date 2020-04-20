import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
      WorldTime instance = WorldTime(location: 'Tokyo' , flag: 'japan.png' , url: 'Asia/Tokyo');
      await instance.getTime();

//pushreplacementname means new navigation/page appear dan replace page yg sebelumnya..thats why back button x dop
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location' : instance.location,
        'time' : instance.time,
        'flag' : instance.flag,
        'isDayTime' : instance.isDayTime,
      });

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,
          ),
      ),
    );
  }
}

