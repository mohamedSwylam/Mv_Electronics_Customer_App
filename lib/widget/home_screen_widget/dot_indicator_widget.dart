import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/shared/styles/color.dart';

class DotIndicatorWidget extends StatelessWidget {
  final double scrollPosition;
  final int dotCount;
  const DotIndicatorWidget({
    required this.scrollPosition,
    required this.dotCount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DotsIndicator(
            dotsCount: dotCount,
            position: scrollPosition,
            decorator: DotsDecorator(
              activeColor: defaultColor,
              spacing: EdgeInsets.all(2),
              size: const Size.square(6),
              activeSize: Size(12, 6),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
