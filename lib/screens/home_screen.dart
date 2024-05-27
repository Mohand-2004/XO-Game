import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/cubits/info%20cubit/info_cubit.dart';
import 'package:xo_game/cubits/info%20cubit/states.dart';
import 'package:xo_game/cubits/time%20cubit/states.dart';
import 'package:xo_game/cubits/time%20cubit/time_cubit.dart';
import 'package:xo_game/models/app_color.dart';
import 'package:xo_game/models/player.dart';
import 'package:xo_game/widgets/my_container.dart';
import 'package:xo_game/widgets/next_turn_botton.dart';
import 'package:xo_game/widgets/score_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // home screen
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // top space
                const Expanded(flex: 45, child: SizedBox()),

                // app logo
                Expanded(
                  flex: 50,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 100.w),
                    child: const Image(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/app bar.png'),
                    ),
                  ),
                ),

                // space between
                const Expanded(flex: 5, child: SizedBox()),

                // horizental line between the body and the app bar
                Divider(
                  color: AppColor.grey.basic,
                  thickness: 2.5.h,
                  indent: 22.w,
                  endIndent: 22.w,
                ),
              ],
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: BlocProvider(
            create: (context) => appStateController.infoCubit,
            child: Column(
              children: [
                // top space
                const Expanded(flex: 2, child: SizedBox()),

                // dashboard
                Expanded(
                    flex: 20,
                    child: MyContainer(
                      margin: const EdgeInsets.only(top: 5),
                      color: Colors.white,
                      bordercolor: AppColor.grey.basic,
                      borderwidth: 3,
                      radius: 25,
                      child: Row(
                        children: [
                          // left space
                          SizedBox(
                            width: 15.w,
                          ),

                          // players scores column
                          Expanded(
                            child: BlocBuilder<InfoCubit,InfoState>(
                            builder: (context,state){
                              return Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  // player x score
                                  ScoreRow(
                                    player: playerX,
                                  ),

                                  // player o score
                                  ScoreRow(
                                    player: playerO,
                                  ),
                                ],
                              );
                            },
                          )),

                          // space between
                          SizedBox(
                            width: 15.w,
                          ),

                          // timer and turns column
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: BlocProvider(
                              create: (context) => appStateController.timeCubit,
                              child: Column(
                                children: [
                                  // turns timer
                                  Expanded(
                                      flex: 80,
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: MyContainer(
                                          margin: const EdgeInsets.all(5),
                                          color: Colors.white,
                                          bordercolor: AppColor.grey.basic,
                                          borderwidth: 3,
                                          radius: 19,
                                          child: FittedBox(
                                            fit: BoxFit.contain,
                                            child: BlocBuilder<TimeCubit,
                                                DashboardTimeState>(
                                              builder: (context, state) {
                                                return Text(
                                                  '${state.time}',
                                                  style: const TextStyle(
                                                    fontFamily: 'Impact',
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      )),

                                  // current turn text
                                  Expanded(
                                      flex: 20,
                                      child: SizedBox(
                                        child: FittedBox(
                                          fit: BoxFit.contain,
                                          child:
                                              BlocBuilder<InfoCubit, InfoState>(
                                            builder: (context, state) {
                                              return Text(
                                                'current turn ${appStateController.playersQueue.peek()?.lable.name}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Comic Sans',
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )),

                          // right space
                          const SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    )),

                // GridWidget
                Expanded(
                    flex: 66,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 38, horizontal: 15.w),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: appStateController.grid.gridWidget,
                      ),
                    )),

                // next turn botton row
                const Expanded(
                    flex: 10,
                    child: Row(
                      children: [
                        // left space
                        Expanded(
                          flex: 60,
                          child: SizedBox(),
                        ),

                        // next turn botton
                        Expanded(
                          flex: 40,
                          child: SizedBox(
                            child: NextTurnBotton(),
                          ),
                        ),
                      ],
                    )),

                // bottom space
                const Expanded(flex: 2, child: SizedBox())
              ],
            ),
          ),
        ));
  }
}
