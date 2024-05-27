import 'package:xo_game/cubits/grid%20cubit/grid_cubit.dart';
import 'package:xo_game/cubits/info%20cubit/info_cubit.dart';
import 'package:xo_game/cubits/time%20cubit/time_cubit.dart';
import 'package:xo_game/data%20structure/queque.dart';
import 'package:xo_game/models/grid.dart';
import 'package:xo_game/models/player.dart';
import 'package:xo_game/models/result.dart';

AppStateController appStateController = AppStateController();
class AppStateController{
  final InfoCubit infoCubit = InfoCubit();
  final TimeCubit timeCubit = TimeCubit();
  final GridCubit gridCubit = GridCubit();
  final Queque<Player> playersQueue = Queque();
  Grid grid = Grid();
  AppStateController(){
    _initPlayersQueue();
    infoCubit.startbeginningtimer(playersQueue.peek()!);
  }

  // initialize players queue
  void _initPlayersQueue(){
    playersQueue.enqueque(playerX);
    playersQueue.enqueque(playerO);
  }

  // swap turns
  void _swapturns(){
    _swapPlayersQueue();
    infoCubit.changeturns(playersQueue.peek()!);
  }

  // function to determine the next state
  void checkState(){
    // add the current cell to current player cells
    playersQueue.peek()!.addCell(grid.clickedCellIndex+1);

    // disable clicked cells
    grid.disableClikedCell();

    // check if the current player has won
    if(playersQueue.peek()!.hasWon()){
      // increment current player score
      playersQueue.peek()!.incrementWins();
      // emit win state
      infoCubit.announceresult(WinResult(winner: playersQueue.peek()!));
      // reset grid to defualt state to play a new game
      gridCubit.reset();
      // empty players cells list
      _resetPlayersCells();
      // swap players in the players queue
      _swapPlayersQueue();
    }
    else if(grid.clickedCells.length == 9){
      infoCubit.announceresult(TieResult());
      gridCubit.reset();
      // empty players cells list
      _resetPlayersCells();
      // swap players in the players queue
      _swapPlayersQueue();
    }
    else{
      _swapturns();
    }
  }

  // reset players cells
  void _resetPlayersCells(){
    for(int i = 0;i<2;i++){
      playersQueue[i]!.resetcells();
    }
  }

  // swap players in queue
  void _swapPlayersQueue(){
    playersQueue.enqueque(playersQueue.dequeue()!);
  }
}