import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/shared/styles/color.dart';

import 'dot_indicator_widget.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: PageView(
                onPageChanged: (value) =>
                    AppCubit.get(context).pageViewBannerChange(value),
                children: [
                  Center(
                    child: Text('Banner 1',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text('Banner 2',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text('Banner 3',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 10.0,
          child: DotIndicatorWidget(
            scrollPosition: AppCubit.get(context).scrollPositionBanner,
          ),
        ),
      ],
    );
  }
}
