import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    //if we receive data from other page by URL..this case..loading data send to home page..
    data =  data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue[400] : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  color: Colors.indigoAccent,
                  onPressed: () async {
//pushname means new navigation/page appear dan bertindih dgn page yg sebelumnya..thats why ada back button
// why we used dynamic..sbb x sure data return bentuk apa..x nk specific dan blh bertukar2..play safe pakai dynamic
                   dynamic result = await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                       'time' : result['time'],
                       'location' : result['location'],
                       'isDayTime' : result['isDayTime'],
                       //'flag' : result['flag'],
                     };
                   });

                  },
                  icon: Icon(
                      Icons.location_city,
                      color: Colors.grey[300],
                  ),
                  label: Text(
                    'Select Location',
                     style: TextStyle(
                       color: Colors.grey[300],
                     ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style : TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 5.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style : TextStyle(
                      fontSize: 60.0,
                      letterSpacing: 5.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
