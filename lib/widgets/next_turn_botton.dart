import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/models/app_color.dart';
class NextTurnBotton extends StatelessWidget{
  const NextTurnBotton({super.key,});
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: (){
        appStateController.timeCubit.endtime();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          gradient: LinearGradient(
            colors: [
              AppColor.blue.basic,
              AppColor.red.basic
            ],
            end: Alignment.bottomRight
          ),
        ),
        child: Center(
          child: Text(
            'Next Turn',
            style: TextStyle(
              fontFamily: 'Comic Sans',
              color: Colors.white,
              fontSize: 18.sp,
            ),
          )
        ),
      ),
    );
  }
}