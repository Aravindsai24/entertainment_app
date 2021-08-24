import 'package:entertainment_app/Sports/Cricket/CricketApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cricket.dart';

class CricketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(title:Text('Cricket'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Live'),
                Tab(text: 'Upcoming'),
                Tab(text: 'Finished'),
              ],
            ),
          ),
          body: TabBarView(children: [
            FutureBuilder(
                future: CricketApi().getAllMatchesCricket(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var allmatches = snapshot.data as CricketMatch;
                    return MatchList(allmatches.live);
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                }),
            FutureBuilder(
                future: CricketApi().getAllMatchesCricket(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var allmatches = snapshot.data as CricketMatch;
                    return MatchList(allmatches.upcoming);
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                }),
            FutureBuilder(
                future: CricketApi().getAllMatchesCricket(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var allmatches = snapshot.data as CricketMatch;
                    return MatchList(allmatches.finished);
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                }),
          ])),
    );
  }

  MatchList(List<Cricket>? allmatches) {
    return  Container(
    margin: new EdgeInsets.only(top:5),
        child:ListView.builder(
            itemCount: allmatches!.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 50,
                  margin: new EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Container(
                      padding: new EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.sports_cricket),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            allmatches[index].seriesName!,
                          ),
                        ],
                      )));
            }));
  }
}
