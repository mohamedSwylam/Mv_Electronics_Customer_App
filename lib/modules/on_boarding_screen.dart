import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:mv_customet_app/shared/network/local/cache_helper.dart';
import 'package:mv_customet_app/widget/on_board_page.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double scrollPosition = 0;




  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Navigator.pushNamedAndRemoveUntil(
            context, 'AppLayout', (route) => false);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
     [
       DeviceOrientation.portraitDown,
       DeviceOrientation.portraitUp,
     ]
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                scrollPosition = value.toDouble();
              });
            },
            children: [
              const OnBoardPage(
                boardImage: 'assets/images/board9.png',
                title: 'Welcome To \n  Electronic App',
                subTitle:
                '+100 Million Products \n +100 Categories \n +20 Brands',
              ),
              OnBoardPage(
                boardImage: 'assets/images/board1.png',
                title: '7 - 14 \n Days Return',
                subTitle: 'Satisfaction Guranteed',
              ),
              OnBoardPage(
                boardImage: 'assets/images/board2.png',
                title: 'Experience  \n Smart Shopping',
                subTitle:
                'Choose your product \n we have many categories \n electronics',
              ),
              OnBoardPage(
                boardImage: 'assets/images/board3.png',
                title: 'Safe And \n Secure  Payments',
                subTitle:
                'We can deliver your \n product to your home in \n any government',
              ),
              OnBoardPage(
                boardImage: 'assets/images/board8.png',
                title: 'Find Your \n Favorite Product',
                subTitle: 'We have many \n sales and many best \n offers',
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 5,
                  decorator: DotsDecorator(
                    activeColor: Colors.white,
                  ),
                  position: scrollPosition,
                ),
                SizedBox(
                  height: 2.h,
                ),
                scrollPosition == 4 ? ElevatedButton(onPressed: () {
                 submit();
                },
                  child: Text('Start Shopping'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(
                      Colors.cyan),),):
                TextButton(
                  child: Text(
                    'Skip To The App >',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    submit();
                  },
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

