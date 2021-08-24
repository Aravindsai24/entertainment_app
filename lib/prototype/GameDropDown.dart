import 'package:flutter/material.dart';

class GameDropDown extends StatefulWidget {
  const GameDropDown({Key? key}) : super(key: key);

  @override
  _GameDropDownState createState() => _GameDropDownState();
}

class _GameDropDownState extends State<GameDropDown> {
  var games = {'Cricket', 'Football'};
  String? InitialGame='Cricket';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(items: games.map((e){

      return DropdownMenuItem(value:e,
          child: Text(e),);
    }
  ).toList(),value: InitialGame,
      onChanged: (String? newValue){
      setState(() {
        InitialGame=newValue;
        //fetch data and show


      });
      },
  underline: SizedBox(width: 0,),dropdownColor: Colors.blueAccent,);
}}
