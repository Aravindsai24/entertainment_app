import 'package:entertainment_app/Football/matchstat.dart';
import 'package:flutter/material.dart';
import 'package:entertainment_app/Football/goalstat.dart';

import 'FootballMatch.dart';


Widget MatchTile(FootballMatch match) {
  var homeGoal = match.goal!.home;
  var awayGoal = match.goal!.away;
  if (homeGoal == null) homeGoal = 0;
  if (awayGoal == null) awayGoal = 0;

  return InkWell(
  child:Container(
    margin: EdgeInsets.symmetric(vertical: 12.0),
    child: Expanded(
      child:Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.home!.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
        Image.network(
          match.home!.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            "$homeGoal - $awayGoal",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.away!.logoUrl,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            match.away!.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    ),)
  ),
  );
}