import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //location name kt UI nnti
  String time; // time utk location
  String flag; //url asset utk flag location icon
  String url; //contain timezone/area utk letak dlm link API
  bool isDayTime; //true or false if daytime or not
  WorldTime({this.location , this.flag , this.url});

  Future<void> getTime() async{

    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String offSet = data['utc_offset'];
      String dateTime = data['datetime'];

      DateTime now = DateTime.parse(dateTime).add(Duration(hours: int.parse(offSet.substring(1,3))));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);

    } catch (e){
      print('Hit Error : $e');
      time = 'Unable to retieve data';

    }

  }

}


