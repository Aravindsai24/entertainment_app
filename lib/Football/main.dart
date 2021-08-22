import 'package:flutter/material.dart';
import 'package:entertainment_app/Football/FootballMatch.dart';

import 'FootballApi.dart';
import 'PageBody.dart';

//void main() => runApp(MyApp());

class MyFootballApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FootballApp(),
    );
  }
}

class FootballApp extends StatefulWidget {
  const FootballApp({Key? key}) : super(key: key);

  @override
  _FootballAppState createState() => _FootballAppState();
}

class _FootballAppState extends State<FootballApp> {
  late Future<List<FootballMatch>> allmatches;
  void initState() {
    super.initState();
    allmatches=FootballApi().getAllMatches();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'FOOTBALL',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: allmatches,
          builder: (context,snapshot) {
            if (snapshot.hasData) {
             //print((snapshot.data!.length));
              return PageBody(snapshot.data as List<FootballMatch>);
            } else if (snapshot.hasError){
              print("hahaha ${snapshot.error}");
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          ),
    );
  }
}
