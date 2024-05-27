import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/cubits/info%20cubit/info_cubit.dart';
import 'package:xo_game/cubits/info%20cubit/states.dart';
import 'package:xo_game/widgets/result_lable.dart';
import 'screens/home_screen.dart';

// app
class XOGame extends StatelessWidget {
  const XOGame({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocProvider(
            create: (context) => appStateController.infoCubit,
            child: Stack(
              children: [
                // home screen
                const HomeScreen(),

                // result lable
                BlocBuilder<InfoCubit,InfoState>(
                  builder: (context,state){
                    if(state is ResultState){
                      return ResultLable(state: state);
                    }else if (state is TimeState){
                      return SizedBox(
                        child: Center(
                          child: Text(
                          state.time,
                          style: TextStyle(
                            fontFamily: 'Impact',
                            fontSize: 300.sp,
                            color: state.color,
                          ),
                        )),
                      );
                    }else{
                      return const SizedBox();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main(){
  runApp(const XOGame());
}