import 'package:path/path.dart';
import 'package:flutter/material.dart';
import '../../prototype/FootballMatch.dart';
import 'FootballMatchtwo.dart';
import 'matchScreen.dart';


Widget MatchTile(FootballMatchtwo match,BuildContext context) {
  var homeGoal = match.goal!.home;
  var awayGoal = match.goal!.away;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return InkWell(
  child:Container(
    height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey, //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
    margin: new EdgeInsets.only(top:5),
    padding: EdgeInsets.symmetric(horizontal: 40.0,vertical: 10),
    child: Expanded(
      child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.sports_soccer),
        Expanded(
          child: Text(
            match.homeTeam!.teamname.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "$homeGoal - $awayGoal",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
        Icon(Icons.sports_soccer),
        Expanded(
          child: Text(
            match.awayTeam!.teamname.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    ),)
  ),
    onTap:(){
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => matchScreen(match)));
    },
  );
}
