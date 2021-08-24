import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'FootballMatchtwo.dart';
import 'goalstat.dart';
import 'matchstat.dart';

class matchScreen extends StatelessWidget {
  FootballMatchtwo match;

  matchScreen(this.match);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child:  Row(
              children: [
                //if(allmatches.length!=0)
                Expanded(
                    flex:2,
                    child:teamStat("Home", match.homeTeam!.teamname.toString())),

                Expanded(
                  flex:1,
                  child:goalStat(match),
                ),
                Expanded(
                    flex:2,
                    child:teamStat("Away", match.awayTeam!.teamname.toString())),
              ],
            ),
      ),
    );
  }
}
