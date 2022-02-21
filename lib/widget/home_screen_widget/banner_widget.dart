import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:getwidget/getwidget.dart';


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
            child: AppCubit.get(context).banners.isEmpty ? GFShimmer(
              showShimmerEffect: true,
              mainColor: Colors.grey.shade500,
              secondaryColor: Colors.grey.shade400,
              child: Container(
                color: Colors.grey.shade300,
                height: 140,
                width: MediaQuery.of(context).size.width,
              ),)
                :Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade200,
              child: PageView.builder(
                itemCount:AppCubit.get(context).banners.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    '${AppCubit.get(context).banners[index]}',fit: BoxFit.cover,);
                },
                onPageChanged: (value) =>
                    AppCubit.get(context).pageViewBannerChange(value),
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
