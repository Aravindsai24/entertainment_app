import 'package:entertainment_app/Sports/Football/DropDownSeasons.dart';
import 'package:flutter/material.dart';
import 'FootballMatchtwo.dart';
import 'MatchTile.dart';

Widget PageBody(List<dynamic> allmatches) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: DropDownSeasons(),
        ),
        Expanded(
          child: Container(
            // margin: new EdgeInsets.only(top: 10),
            child: ListView.builder(
              itemCount: allmatches.length,
              itemBuilder: (context, index) {
                return MatchTile(allmatches[index], context);
              },
            ),
          ),
        ),
      ],
    ),
  );
}
