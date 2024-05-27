import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/cubits/grid%20cubit/states.dart';
import 'package:xo_game/widgets/cell.dart';
class GridCubit extends Cubit<RefreshGridState>{
  GridCubit():super(RefreshGridState());
  void reset(){
    appStateController.grid.clickedCellIndex = -1;
    appStateController.grid.clickedCells = [];
    for(int i = 1;i<10;i++){
      appStateController.grid.cells[i-1] = Cell(cellID: i);
    }
    emit(RefreshGridState());
  }
}