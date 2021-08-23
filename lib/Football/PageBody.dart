import 'package:flutter/material.dart';
import 'FootballMatch.dart';
import 'MatchTile.dart';
import 'goalstat.dart';
import 'matchstat.dart';

Widget PageBody(List<FootballMatch> allmatches) {
  return Column(
    children: [
      // Expanded(
      //   flex: 2,
      //   child: Container(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           //if(allmatches.length!=0)
      //           teamStat("Home", allmatches[0].home!.logoUrl, allmatches[0].home!.name),
      //
      //           goalStat(allmatches[0]),
      //           teamStat("Away", allmatches[0].away!.logoUrl, allmatches[0].away!.name),
      //
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFF4373D9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      return MatchTile(allmatches[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}