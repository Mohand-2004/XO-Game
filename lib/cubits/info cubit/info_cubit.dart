import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/cubits/info%20cubit/states.dart';
import 'package:xo_game/data%20structure/queque.dart';
import 'package:xo_game/models/app_color.dart';
import 'package:xo_game/models/player.dart';
import 'package:xo_game/models/result.dart';
class InfoCubit extends Cubit<InfoState>{
  InfoCubit():super(GameState());
  late Queque<Color> _colorsQueque;

  // function to get the timer color
  Color _getcolor(){
    Color currentColor = _colorsQueque.dequeue()!;
    _colorsQueque.enqueque(currentColor);
    return currentColor;
  }

  // a function to add the colors to the queque
  void _colorsQuequeInitialize(){
    _colorsQueque = Queque();
    _colorsQueque.enqueque(AppColor.blue.transparent);
    _colorsQueque.enqueque(AppColor.grey.transparent);
    _colorsQueque.enqueque(AppColor.red.transparent);
  }

  // app begininng timer
  void startbeginningtimer(Player player) async {
    _colorsQuequeInitialize();
    int time = 3;
    while(time >= 0){
      emit(TimeState(time: time,color: _getcolor()));
      await Future.delayed(const Duration(seconds: 1),(){time--;});
    }
    emit(TurnState(player: player));
    _removeresultpage();
  }

  // change turns
  void changeturns(Player player){
    emit(TurnState(player: player));
    _removeresultpage();
  }


  // announce result
  void announceresult(Result result){
    if(result is WinResult){
      emit(WinState(winner: result.winner));
    }
    else{
      emit(TieState());
    }
    _removeresultpage();
  }

  // remove result page
  void _removeresultpage() async {
    await Future.delayed(
      const Duration(seconds: 2),(){
        emit(GameState());
      }
    );
    appStateController.timeCubit.starttime();
  }
}