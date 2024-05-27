import 'package:flutter/material.dart';
import 'package:xo_game/models/app_color.dart';
import 'package:xo_game/models/lable.dart';
import 'package:xo_game/models/player.dart';
abstract class InfoState{}
abstract class ResultState extends InfoState{
  late MyAppTheme theme;
  late ImageProvider image;
  late Widget resultTextWidget;
}
class WinState extends ResultState{
  WinState({required Player winner}){
    super.resultTextWidget = Row(
      children: [
        const Text(
          'winner ',
          style: TextStyle(
            fontFamily: 'Monotype Corsiva',
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        Text(
          winner.lable.name,
          style: TextStyle(
            fontFamily: 'Monotype Corsiva',
            fontWeight: FontWeight.bold,
            color: winner.theme.basic
          ),
        ),
        const Text(
          ' has won',
          style: TextStyle(
            fontFamily: 'Monotype Corsiva',
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        )
      ],
    );
    winner.lable == Lable.X ? super.image = const AssetImage('assets/images/first.png') : super.image = const AssetImage('assets/images/first1.png');
    super.theme = winner.theme;
  }
}
class TieState extends ResultState{
  TieState(){
    super.theme = AppColor.grey;
    super.image = const AssetImage('assets/images/tie icon1.png');
    super.resultTextWidget = const Text(
      'Tie',
      style: TextStyle(
        fontFamily: 'Monotype Corsiva',
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    );
  }
}
class TurnState extends ResultState{
  TurnState({required Player player}){
    super.resultTextWidget = Row(
      children: [
        const Text(
          'Player ',
          style: TextStyle(
            fontFamily: 'Monotype Corsiva',
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        Text(
          player.lable.name,
          style: TextStyle(
            fontFamily: 'Monotype Corsiva',
            fontWeight: FontWeight.bold,
            color: player.theme.basic
          ),
        ),
        const Text(
          ' turn',
          style: TextStyle(
            fontFamily: 'Monotype Corsiva',
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ],
    );
    super.theme = player.theme;
    super.image = player.image;
  }
}
class GameState extends InfoState{}
class TimeState extends InfoState{
  late String _time;
  late Color _color;
  TimeState({required int time,required Color color}){
    _time = '$time';
    _color = color;
  }
  String get time => _time;
  Color get color => _color;
}