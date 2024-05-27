import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xo_game/cubits/app%20state%20controller/app_state_controller.dart';
import 'package:xo_game/cubits/grid%20cubit/grid_cubit.dart';
import 'package:xo_game/cubits/grid%20cubit/states.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    super.key,
  });
  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  bool clickable(int cellID) {
    for (int i in appStateController.grid.clickedCells) {
      if (i == cellID) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => appStateController.gridCubit,
      child: SizedBox(
        child: BlocBuilder<GridCubit,RefreshGridState>(
          builder: (context, state) {
            return Column(
              children: [
                // fitst row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(1)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            0) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 0;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[0]))),

                      // space between
                      SizedBox(
                        width: 20.h,
                      ),

                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: GestureDetector(
                            onTap: (){
                              if (clickable(2)) {
                                setState(() {
                                  if (appStateController.grid.clickedCellIndex ==1) {
                                    appStateController.grid.clickedCellIndex = -1;
                                  }else {
                                    appStateController.grid.clickedCellIndex = 1;
                                  }
                                  appStateController.grid.rebuild();
                                });
                              }
                            },
                            child: appStateController.grid.cells[1]
                          )
                        )
                      ),

                      // space between
                      SizedBox(
                        width: 20.h,
                      ),

                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(3)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            2) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 2;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[2]))),
                    ],
                  ),
                ),

                // space between
                SizedBox(
                  height: 5.h,
                ),

                // second row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(4)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            3) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 3;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[3]))),

                      // space between
                      SizedBox(
                        width: 20.h,
                      ),

                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(5)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            4) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 4;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[4]))),

                      // space between
                      SizedBox(
                        width: 20.h,
                      ),

                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(6)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            5) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 5;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[5]))),
                    ],
                  ),
                ),

                // space between
                SizedBox(
                  height: 5.h,
                ),

                // third row
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(7)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            6) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 6;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[6]))),

                      // space between
                      SizedBox(
                        width: 20.h,
                      ),

                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(8)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            7) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 7;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[7]))),

                      // space between
                      SizedBox(
                        width: 20.h,
                      ),

                      Expanded(
                          child: AspectRatio(
                              aspectRatio: 1,
                              child: GestureDetector(
                                  onTap: () {
                                    if (clickable(9)) {
                                      setState(() {
                                        if (appStateController
                                                .grid.clickedCellIndex ==
                                            8) {
                                          appStateController
                                              .grid.clickedCellIndex = -1;
                                        } else {
                                          appStateController
                                              .grid.clickedCellIndex = 8;
                                        }
                                        appStateController.grid.rebuild();
                                      });
                                    }
                                  },
                                  child: appStateController.grid.cells[8]))),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
