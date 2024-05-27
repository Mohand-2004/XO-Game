import 'package:xo_game/widgets/cell.dart';
import 'package:xo_game/widgets/grid_widget.dart';
class Grid{
  List<Cell> cells = [];
  List<int> clickedCells = [];
  GridWidget gridWidget = const GridWidget();
  int clickedCellIndex = -1;
  Grid(){
    for(int i = 1;i<10;i++){
      cells.add(Cell(cellID: i));
    }
  }

  // function to rebuild grid
  void rebuild(){
    late bool found;
    for(int i = 1;i<10;i++){
      found = false;
      for(int j in clickedCells){
        if(i == j){
          found = true;
        }
      }
      if(!found){
        cells[i-1] = Cell(cellID: i);
      }
    }
  }
  
  // function to add the clicked cell to the list
  void disableClikedCell(){
    if(clickedCellIndex != -1){
      clickedCells.add(clickedCellIndex+1);
    }
  } 
}