import 'package:flutter/material.dart';

//on this part learn more about async data / block data
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async{ //nk pakai await kene ad async

    //simulate network request for a username
    String  username = await Future.delayed(Duration(seconds: 3),(){
      return 'yoshi';
    });

    //simulate network request for a username
    String biography = await Future.delayed(Duration(seconds: 3),(){
      return '28, Cat Lover , Fat';
    });

    print('data = $username - $biography');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('print inside initState');
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
      body:  Text(
          'choose location'
      ),
    );
  }
}
