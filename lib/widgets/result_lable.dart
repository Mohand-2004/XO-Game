import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xo_game/cubits/info%20cubit/states.dart';
import 'package:xo_game/models/app_color.dart';
class ResultLable extends StatelessWidget{
  final ResultState state;
  const ResultLable({super.key,required this.state});
  @override
  Widget build(BuildContext context){
    return Container(
      color: state.theme.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Center(
          child: Column(
            children: [
              // top space
              const Expanded(flex: 28,child: SizedBox()),
          
              // result image
              Expanded(
                flex: 40,
                child: Padding(
                  padding: EdgeInsets.only(left: state is TurnState && state.theme == AppColor.blue ? 22.w : 0),
                  child: Image(
                    fit: BoxFit.contain,
                    image: state.image,
                  ),
                )
              ),
          
              // space between
              const SizedBox(height: 15,),
          
              // result text
              Expanded(
                flex: 10,
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: state.resultTextWidget,
                    ),
                  ),
                ),
              ),
          
              // bottom space
              const Expanded(flex: 22,child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}