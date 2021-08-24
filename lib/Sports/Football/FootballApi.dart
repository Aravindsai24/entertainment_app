import 'dart:convert';
import 'package:http/http.dart';

import 'FootballMatchtwo.dart';

class FootballApi {
  final apiUrl=Uri.parse("https://api.football-data.org/v2/competitions/WC/matches");
  // void setSeason(String? season){
  //   String? url="https://v3.football.api-sports.io/fixtures?season=$season&league=39";
  //   apiUrl=url;
  //   print(apiUrl);
  // }

  static const headers = {
    'X-Auth-Token': "97f0cea2512743b7a075e3c7f4f12169",
  };

  Future<List<FootballMatchtwo>> getAllMatches() async {
    Response res = await get(apiUrl, headers: headers);
    var body;
    List<FootballMatchtwo> matches=[];
    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      //print(body);
      List<dynamic> matchesList = body['matches'];
      //print(matchesList[0]);
      //print("Api service: $body"); // to debug
      matches = mapper(matchesList);
      print(matches[0].homeTeam!.teamname);
      //print(matches.length);
    }
    return matches;
  }
  mapper(List<dynamic> matchesList){
    List<FootballMatchtwo> newmatch=[];
    for(int i=0;i  < matchesList.length;i++) {
      newmatch.add(FootballMatchtwo.fromJson(matchesList[i]));
      //print(newmatch[i].home!.name);
    }

    return newmatch;
  }

  }

