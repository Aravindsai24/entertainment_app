class FootballMatch{
  Fixture? fixture;
  HomeTeam? home;
  AwayTeam? away;
  Goal? goal;
  FootballMatch(this.fixture, this.home, this.away, this.goal);

  factory FootballMatch.fromJson(Map<String, dynamic> json) {
    //print(xyz.goal!.home);
    return FootballMatch(
        Fixture.fromJson(json['fixture']),
        HomeTeam.fromJson(json['teams']),
        AwayTeam.fromJson(json['teams']),
        Goal.fromJson(json['goals']));
  }
}

//here we will store the fixture
class Fixture {
  int id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(json['id'], json['date'], Status.fromJson(json['status']));
  }
}

//here we will store the Status
class Status {
  int elapsedTime;
  String long;
  Status(this.elapsedTime, this.long);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'], json['long']);
  }
}

//here we will store the Team data
class HomeTeam {
  int id;
  String name;
  String logoUrl;
  bool? winner;
  HomeTeam(this.id, this.name, this.logoUrl, this.winner);

  factory HomeTeam.fromJson(Map<String, dynamic> json) {
    return HomeTeam(json['home']['id'], json['home']['name'], json['home']['logo'], json['home']['winner']);
  }
}
class AwayTeam {
  int id;
  String name;
  String logoUrl;
  bool? winner;
  AwayTeam(this.id, this.name, this.logoUrl, this.winner);

  factory AwayTeam.fromJson(Map<String, dynamic> json) {
    return AwayTeam(json['away']['id'], json['away']['name'], json['away']['logo'], json['away']['winner']);
  }
}

//here we will store the Goal data
class Goal {
  int home;
  int away;
  Goal(this.home, this.away);

  //Now we will create a factory method to copy the data from
  // the json file
  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(json['home'], json['away']);
  }
}