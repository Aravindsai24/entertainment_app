import 'dart:convert';

import 'package:entertainment_app/Sports/Cricket/Cricket.dart';
import 'package:http/http.dart';

class CricketApi {
  final cricUrl =
      Uri.parse("https://cricket-live-score4.p.rapidapi.com/apis/series");
  static const headers = {
    'x-rapidapi-host': 'cricket-live-score4.p.rapidapi.com',
    'x-rapidapi-key': '10633d5bbemsh4c324468aa82805p1ba9c2jsn0f84b9e0594b'
  };

  Future<CricketMatch?> getAllMatchesCricket() async {
    Response res = await get(cricUrl, headers: headers);
    var body;
    List<Cricket> Livematches;
    List<Cricket> upcomingmatches ;
    List<Cricket> finishedmatches;
    if (res.statusCode == 200) {
      // this mean that we are connected to the data base
      body = jsonDecode(res.body);
      //print(body);
      List<dynamic> LivematchList = body['series']['live'];
      List<dynamic> upcomingmatchList = body['series']['upcoming'];
      List<dynamic> finishedmatchList = body['series']['completed'];
      Livematches =
          LivematchList.map((dynamic item) => Cricket.fromJson(item)).toList();
      upcomingmatches =
          upcomingmatchList.map((dynamic item) => Cricket.fromJson(item)).toList();
      finishedmatches =
          finishedmatchList.map((dynamic item) => Cricket.fromJson(item)).toList();
      print(Livematches[0]);
      return new CricketMatch(Livematches, upcomingmatches, finishedmatches);
      //print(matches.length);
    }
  }
}
