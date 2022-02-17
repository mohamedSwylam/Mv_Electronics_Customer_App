import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1800),
    )..repeat(min: 0,max: 1.0);
    _animation=CurvedAnimation(parent: _controller, curve: Curves.linear,);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () => navigateAndFinish(context, LoginScreen()));
    var cubit = RiderAppCubit.get(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            FadeAnimation(
              1.2,
              Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/mob.json',width:80.w,height: 30.h),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    "Electronics App",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: defaultColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
