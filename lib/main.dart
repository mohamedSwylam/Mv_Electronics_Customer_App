import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mv_customet_app/modules/on_boarding_screen.dart';
import 'package:mv_customet_app/modules/splash_screen.dart';
import 'package:mv_customet_app/shared/bloc_observer.dart';
import 'package:mv_customet_app/shared/network/local/cache_helper.dart';
import 'layout/app_layout.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'package:sizer/sizer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                title: 'Customer App',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: 'Lato',
                ),
                routes: {
                  'SplashScreen' : (context) => SplashScreen(),
                  'OnBoardingScreen' : (context) => OnBoardingScreen(),
                  'AppLayout' : (context) => AppLayout(),
                },
                initialRoute: 'SplashScreen',
              );
            }
          );
        },
      ),
    );
  }
}


