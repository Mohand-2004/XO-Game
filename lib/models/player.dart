import 'package:flutter/material.dart';
import 'package:xo_game/models/app_color.dart';
import 'package:xo_game/models/lable.dart';
class Player{
  final MyAppTheme theme;
  final Lable lable;
  late ImageProvider image;
  int _winTimes = 0;
  List<int> _cells = [];
  Player({required this.theme,required this.lable,}){
    image = AssetImage('assets/images/${lable.name.toLowerCase()}.png');
  }
  int get winTimes => _winTimes;
  void incrementWins(){
    _winTimes++;
  }

  bool hasWon(){
    if(
      (_cells.contains(1) && _cells.contains(2) && _cells.contains(3)) || 
      (_cells.contains(4) && _cells.contains(5) && _cells.contains(6)) || 
      (_cells.contains(7) && _cells.contains(8) && _cells.contains(9)) || 
      (_cells.contains(2) && _cells.contains(8) && _cells.contains(5)) || 
      (_cells.contains(1) && _cells.contains(4) && _cells.contains(7)) || 
      (_cells.contains(3) && _cells.contains(6) && _cells.contains(9)) || 
      (_cells.contains(7) && _cells.contains(5) && _cells.contains(3)) || 
      (_cells.contains(1) && _cells.contains(5) && _cells.contains(9))
    ){
        return true;
    }else{
      return false;
    }
  }

  void resetcells(){
    _cells = [];
  }

  void addCell(int cell){
    if(cell != 0){
      _cells.add(cell);
    }
  }
}

// player X decleration
Player playerX = Player(
  theme: AppColor.blue,
  lable: Lable.X,
);

// player O decleration
Player playerO = Player(
  theme: AppColor.red,
  lable: Lable.O,
);