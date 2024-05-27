import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'states.dart';
class TimeCubit extends Cubit<DashboardTimeState>{
  int time = 10;
  TimeCubit():super(DashboardTimeState(time: 0));
  void starttime([int time = 10]) async {
    this.time = time;
    emit(DashboardTimeState(time: 10));
    while(this.time >= 0){
      emit(DashboardTimeState(time: this.time));
      await Future.delayed(const Duration(seconds: 1),(){this.time--;});
    }
    appStateController.checkState();
  }
  void endtime(){
    time = 0;
    emit(DashboardTimeState(time: 0));
  }
}