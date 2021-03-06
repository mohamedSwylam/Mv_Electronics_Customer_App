import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/layout/cubit/states.dart';




class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text(
              'CartScreen',
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
