
import 'package:flutter/material.dart';


class DropDownSeasons extends StatefulWidget {
  const DropDownSeasons({Key? key}) : super(key: key);

  @override
  _DropDownSeasonsState createState() => _DropDownSeasonsState();
}
class _DropDownSeasonsState extends State<DropDownSeasons> {
  var teams = {'FIFA World Cup', 'CL', 'Bundesliga'};
  String? inputTeam = 'FIFA World Cup';

  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
                dropdownColor: Colors.blue,
                //isExpanded: true,
                underline: SizedBox(width: 0,),
                items: teams.map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e,style: TextStyle(fontSize: 20),),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    inputTeam = newValue;
                  });
                },
                value: inputTeam,
    );
  }

}
