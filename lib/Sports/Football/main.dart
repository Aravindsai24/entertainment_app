import 'package:flutter/material.dart';


import 'DropDownSeasons.dart';
import '../../prototype/DropDownWidgetTeams.dart';
import 'FootballApi.dart';
import 'FootballMatchtwo.dart';
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
  late Future<List<FootballMatchtwo>> allmatches;

  void initState() {
    super.initState();
    allmatches = FootballApi().getAllMatches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Football'),),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     GameDropDown(),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     DropDownWidgetTeams(),
            //     SizedBox(
            //       width: 30,
            //     ),
            //     DropDownSeasons(),
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: allmatches,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //print((snapshot.data!.length));
                    return PageBody(snapshot.data as List<FootballMatchtwo>);
                  } else if (snapshot.hasError) {
                    print("hahaha ${snapshot.stackTrace}");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
