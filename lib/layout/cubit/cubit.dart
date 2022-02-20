import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mv_customet_app/layout/cubit/states.dart';
import 'package:mv_customet_app/modules/account_screen/account_screen.dart';
import 'package:mv_customet_app/modules/cart_screen/cart_screen.dart';
import 'package:mv_customet_app/modules/chat_screen/chat_screen.dart';
import 'package:mv_customet_app/modules/home_screen/home_screen.dart';



class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> StoreScreens = [
    HomeScreen(),
    ChatScreen(),
    CartScreen(),
    UserScreen(),
  ];

  void selectedHome() {
    currentIndex = 0;
    emit(ChangeBottomNavState());
  }
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
  void selectCart() {
    currentIndex = 2;
    emit(ChangeBottomNavState());
  }

  void selectChat() {
    currentIndex = 1;
    emit(ChangeBottomNavState());
  }

  void selectUser() {
    currentIndex = 3;
    emit(ChangeBottomNavState());
  }

}