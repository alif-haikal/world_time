import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
//on this part learn more about async data / block data
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Japan', flag: 'japan.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

//navigation.pop means go back to previous page yg di-stack..contoh sebab pakai cara ni supaya stack x bertimbun..smooth flow
    Navigator.pop(context, {
        'location' : instance.location,
        'time' : instance.time,
        'flag' : instance.flag,
        'isDayTime' : instance.isDayTime,
    });
}



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal: 4.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
//kalau pnggil normal variable x perlu curly bracer eg: assets/images/$location
//kalau pnggil data dalam object/map perlu curly bracer eg: ${locations[index].flag}
                  backgroundImage: AssetImage('assets/images/${locations[index].flag}'),
                ),
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                  locations[index].location
                ),
              ),
            ),
          );
        }
      )
    );
  }
}
