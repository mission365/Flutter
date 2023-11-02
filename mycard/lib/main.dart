import 'package:flutter/material.dart';

void main() {
  runApp(MyCard());
}
class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 130.0,
                backgroundImage: AssetImage('images/port.jpeg'),
              ),
              Text('Mission Devnath', style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontFamily: 'Pacifico'
              ),
              ),
              Text('Flutter Developer', style: TextStyle(
                fontSize: 30.0,
                color: Colors.teal[1000],
                fontFamily: 'Poppins'
              ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('missiondevnath901@gmail.com', style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal[1000],
                    ),),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('01745523277', style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal[1000],
                    ),),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}



