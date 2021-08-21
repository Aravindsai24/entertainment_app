import 'dart:convert';
import 'package:http/http.dart';

import 'FootballMatch.dart';

class FootballApi {
  final  url = Uri.parse("https://v3.football.api-sports.io/fixtures?season=2020&league=39");
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    //Always make sure to check the api key and the limit of a request in a free api
    'x-rapidapi-key': "75f283c5b57231cb0e16694e36962f17"
  };

  Future<List<FootballMatch>> getAllMatches() async {
    Response res = await get(url, headers: headers);
    var body;
    List<FootballMatch> matches=[];
    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      //print(matchesList[0]);
      //print("Api service: $body"); // to debug
      matches = mapper(matchesList);
      print(matches[1].home!.name);
      //print(matches.length);
    }
    return matches;
  }
  mapper(List<dynamic> matchesList){
    List<FootballMatch> newmatch=[];
    for(int i=0;i  < matchesList.length;i++) {
      newmatch.add(FootballMatch.fromJson(matchesList[i]));
      //print(newmatch[i].home!.name);
    }

    return newmatch;
  }

  }

