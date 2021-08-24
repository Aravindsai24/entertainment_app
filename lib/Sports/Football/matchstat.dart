
import 'package:flutter/material.dart';


Widget teamStat(String team, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Padding(padding:new EdgeInsets.symmetric(vertical: 60),
          child: Text(teamName,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),),
        SizedBox(
          height: 20.0,
        ),
        Text(
          team,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    ),
  );
}
