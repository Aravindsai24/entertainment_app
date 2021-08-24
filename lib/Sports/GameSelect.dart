import 'package:entertainment_app/Sports/Football/main.dart';
import 'package:flutter/material.dart';

import 'Cricket/CricketScreen.dart';

class GameSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gamesList(),
    );
  }
}

class gamesList extends StatelessWidget {
  var gameList = ['Cricket', 'Football', 'BasketBall'];

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: new EdgeInsets.symmetric(horizontal: 50),
          margin: new EdgeInsets.only(top: 40),
          child: Text(
            "SPORTS & GAMES",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: new EdgeInsets.symmetric(horizontal: 30),
            margin: new EdgeInsets.only(top: 30),
            child: ListView(children: <Widget>[
              Expanded(
                child: Container(
                  padding: new EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.sports_cricket),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Cricket',
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CricketScreen()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: new EdgeInsets.symmetric(horizontal: 20),
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blueAccent)
                  // ),
                  height: 50,
                  child: InkWell(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.sports_soccer),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Football',
                          style: TextStyle(fontSize: 21),
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyFootballApp()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: new EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  child: GestureDetector(
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.sports_basketball),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Basketball',
                          style: TextStyle(fontSize: 21),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => MyFootballApp()));
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
