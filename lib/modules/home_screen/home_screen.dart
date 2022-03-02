import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/layout/cubit/states.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:mv_customet_app/widget/home_screen_widget/banner_widget.dart';
import 'package:mv_customet_app/widget/home_screen_widget/brands_heightlight_widget.dart';
import 'package:mv_customet_app/widget/category_screen_widgets/category_widget.dart';
import 'package:mv_customet_app/widget/home_screen_widget/search_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Electronic App',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: defaultColor,
            elevation: 0.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyBold.buy,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: defaultColor,
          body: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 10,),
              BannerWidget(),
              BrandHighLightsWidget(),
              CategoryWidget(),
            ],
          ),
        );
      },
    );
  }
}



