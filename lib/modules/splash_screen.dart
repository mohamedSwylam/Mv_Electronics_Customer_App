import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/shared/network/local/cache_helper.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:mv_customet_app/widget/fade_animation.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
  {
  @override
  void initState() {

  Timer(Duration(seconds: 8), (){
    bool boarding  = CacheHelper.getData(key: 'onBoarding');
    boarding == null?Navigator.pushNamedAndRemoveUntil(context,'OnBoardingScreen', (route) => false):
    boarding == true?Navigator.pushNamedAndRemoveUntil(context,'AppLayout', (route) => false):
    Navigator.pushNamedAndRemoveUntil(context,'OnBoardingScreen', (route) => false);
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/mob.json',width:80.w,height: 30.h,repeat: false),
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
