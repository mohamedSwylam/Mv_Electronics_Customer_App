import 'package:flutter/material.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:sizer/sizer.dart';

class OnBoardPage extends StatelessWidget {
  final String? boardImage;
  final String? title;
  final String? subTitle;

  const OnBoardPage({Key? key, this.boardImage, @required this.title, @required this.subTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: defaultColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 10.h,),
              Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  height: 1.3,

                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                subTitle!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.5,
                  color: Colors.yellow,
                ),
              ),
              SizedBox(height: 2.h,),
              SizedBox(
                  height: 40.h,
                  width: 50.w,
                  child: Image.asset(boardImage!)),
            ],
          ),
        ),
        Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: MediaQuery.of(context).size.width, //screen width
            height: 20.h,
            decoration:  BoxDecoration(
            color: Colors.blueGrey.shade600,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100),),
         ),
    ),),
      ],
    );
  }
}
