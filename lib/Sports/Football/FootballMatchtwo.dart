class FootballMatchtwo{
  MatchDetails? matchDetails;
  Team? homeTeam;
  Team? awayTeam;
  Goal? goal;
  FootballMatchtwo(this.homeTeam, this.awayTeam, this.goal,this.matchDetails);

  factory FootballMatchtwo.fromJson(Map<String, dynamic> json) {
    //print(xyz.goal!.home);
    return FootballMatchtwo(
        Team.fromJson(json['homeTeam']),
        Team.fromJson(json['awayTeam']),
        Goal.fromJson(json['score']['fullTime']),
        MatchDetails.fromJson(json));
  }


}
class Team{
  String? teamname;
  int teamId;
  Team(this.teamId,this.teamname);
  factory Team.fromJson(Map<String,dynamic> json) {
    return Team(json['id'],json['name']);
  }

}
class Goal{
  int? home;
  int? away;
  Goal(this.home,this.away);
  factory Goal.fromJson(Map<String,dynamic> json) {
    return Goal(json['homeTeam'], json['awayTeam']);
  }
}
class MatchDetails{
  String date;
  String Status;
  String? winner;
  MatchDetails(this.date,this.Status,this.winner);
  factory MatchDetails.fromJson(Map<String,dynamic> json){
    return MatchDetails(json['utcDate'],json['status'],json['score']['winner']);
  }


}