import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
          body: cubit.StoreScreens[cubit.currentIndex],
          bottomNavigationBar: TitledBottomNavigationBar(
            activeColor: Colors.cyan,
            enableShadow: true,
            onTap: (index) => cubit.changeIndex(index),
            currentIndex: cubit.currentIndex,
            items: [
              TitledNavigationBarItem(
                  title: Text('Home',
                      style: Theme.of(context).textTheme.subtitle1),
                  icon: Icon(IconlyBold.home),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
              TitledNavigationBarItem(
                  title: Text('Chat',
                      style: Theme.of(context).textTheme.subtitle1),
                  icon: Icon(IconlyBold.chat),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
              TitledNavigationBarItem(
                  title: Text('Cart',
                      style: Theme.of(context).textTheme.subtitle1),
                  icon: Icon(IconlyBold.buy),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
              TitledNavigationBarItem(
                  title: Text(
                    'Account',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  icon: Icon(IconlyBold.user2),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor),
            ],
          ),
        );
      },
    );
  }
}
