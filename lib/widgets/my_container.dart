import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MyContainer extends StatelessWidget{
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? bordercolor;
  final int borderwidth;
  final int radius;
  const MyContainer({super.key,this.child,this.borderwidth = 0,this.color,this.margin,this.padding,this.bordercolor,this.radius = 1});
  @override
  Widget build(BuildContext context){
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(horizontal: borderwidth.w,vertical: borderwidth.h),
      decoration: BoxDecoration(
        color: bordercolor,
        borderRadius: BorderRadius.circular(radius.r)
      ),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular((radius-borderwidth) > 0 ? (radius-borderwidth).r : 0)
        ),
        child: child
      ),
    );
  }
}