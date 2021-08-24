class Cricket {
  String? seriesName;
  String? seriesType;
  String? date;

  Cricket(this.seriesName, this.seriesType, this.date);

  factory Cricket.fromJson(Map<String, dynamic> json) {
    return Cricket(json['series_name'], json['series_type'], json['dates']);
  }
}

class CricketMatch {
  List<Cricket> live;
  List<Cricket> upcoming;
  List<Cricket> finished;

  CricketMatch(this.live, this.upcoming, this.finished);
}
