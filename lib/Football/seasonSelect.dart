import 'package:entertainment_app/Football/FootballApi.dart';
import 'package:entertainment_app/Football/main.dart';
import 'package:flutter/material.dart';

class seasonSelect extends StatefulWidget {
  const seasonSelect({Key? key}) : super(key: key);

  @override
  _seasonSelectState createState() => _seasonSelectState();
}

class _seasonSelectState extends State<seasonSelect> {
  String? dropDownValue = "2021";
  var seasons = {'2021', '2020', '2019', '2018'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select Season',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DropdownButton(
                  items: seasons.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue;
                    });
                  },
                  value: dropDownValue,
                ),
                SizedBox(width: 50),
                RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    FootballApi().setSeason(dropDownValue);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyFootballApp()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
