import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/layout/cubit/states.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:mv_customet_app/widget/home_screen_widget/banner_widget.dart';
import 'package:mv_customet_app/widget/home_screen_widget/search_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: defaultColor,
          body: ListView(
            children: [
              SearchWidget(),
              BannerWidget(),
            ],
          ),
        );
      },
    );
  }
}



