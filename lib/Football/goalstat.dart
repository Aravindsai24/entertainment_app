import 'package:entertainment_app/Football/FootballMatch.dart';
import 'package:flutter/material.dart';

Widget goalStat(FootballMatch match)  {
  var home = match.goal!.home;
  var away = match.goal!.away;
  var elapsed = match.fixture!.status.elapsedTime;
  if (home == null) home = 0;
  if (away == null) away = 0;
  if (elapsed == null) elapsed = 0;
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "${elapsed}'",
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "${home} - ${away}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}