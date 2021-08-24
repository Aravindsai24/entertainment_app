
import 'package:flutter/material.dart';

class DropDownWidgetTeams extends StatefulWidget {
  const DropDownWidgetTeams({Key? key}) : super(key: key);

  @override
  _DropDownWidgetTeamsState createState() => _DropDownWidgetTeamsState();
}
class _DropDownWidgetTeamsState extends State<DropDownWidgetTeams> {
  var teams = {'Real Madrid', 'Barcelona', 'Man City', 'Man Utd'};
  String? inputTeam = 'Real Madrid';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      dropdownColor: Colors.blueAccent,
      //isExpanded: true,
      underline: SizedBox(width: 0,),
      items: teams.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          inputTeam = newValue;
          //print(newValue);
          //apiInfo().season=(newValue.toString());
        });
      },
      value: inputTeam,
    );
  }
}
