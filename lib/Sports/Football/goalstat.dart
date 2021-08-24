
import 'package:flutter/material.dart';

import 'FootballMatchtwo.dart';

Widget goalStat(FootballMatchtwo match)  {
  var home = match.goal!.home;
  var away = match.goal!.away;
  var status = match.matchDetails!.Status;
  if (home == null) home = 0;
  if (away == null) away = 0;
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
    Padding(padding:new EdgeInsets.symmetric(vertical: 60),
    child:Text(
          "${status}",
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
    ),
        SizedBox(height: 10,),
        Text(
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),


      ],
    ),
  );
}