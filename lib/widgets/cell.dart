import 'package:flutter/material.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/models/app_color.dart';
import 'package:xo_game/widgets/my_container.dart';
// ignore: must_be_immutable
class Cell extends StatelessWidget{
  int cellID;
  Cell({super.key,required this.cellID,});

  @override
  Widget build(BuildContext context){
    return MyContainer(
      bordercolor: appStateController.grid.clickedCellIndex == cellID - 1 ? appStateController.playersQueue.peek()!.theme.transparent : AppColor.grey.transparent,
      borderwidth: 3,
      color: Colors.white,
      radius: 20,
      child: appStateController.grid.clickedCellIndex == cellID - 1 ? FittedBox(
        fit: BoxFit.contain,
        child: Text(
          appStateController.playersQueue.peek()!.lable.name,
          style: TextStyle(
            color: appStateController.playersQueue.peek()!.theme.basic,
            fontFamily: 'Berlin Sans FB Demi',
            fontWeight: FontWeight.bold,
          ),
        ),
      ) : null,
    ); 
  }
}