import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/shimmer/gf_shimmer.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/widget/home_screen_widget/dot_indicator_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BrandHighLightsWidget extends StatefulWidget {
  @override
  State<BrandHighLightsWidget> createState() => _BrandHighLightsWidgetState();
}

class _BrandHighLightsWidgetState extends State<BrandHighLightsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Brand HighLight',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Container(
            height: 166,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: PageView.builder(
              itemCount: AppCubit.get(context).brandAd.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 4, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Container(
                                height: 100,
                                color: Colors.deepOrange,
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: AppCubit.get(context)
                                        .brandAd[index]['youtube'],
                                    flags: const YoutubePlayerFlags(
                                      autoPlay: false,
                                      mute: true,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 0, 4, 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      height: 50,
                                      color: Colors.red,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${AppCubit.get(context).brandAd[index]['image1']}',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            GFShimmer(
                                          showShimmerEffect: true,
                                          mainColor: Colors.grey.shade500,
                                          secondaryColor: Colors.grey.shade400,
                                          child: Container(
                                            color: Colors.grey.shade300,
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 0, 8, 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Container(
                                      height: 50,
                                      color: Colors.red,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '${AppCubit.get(context).brandAd[index]['image2']}',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            GFShimmer(
                                          showShimmerEffect: true,
                                          mainColor: Colors.grey.shade500,
                                          secondaryColor: Colors.grey.shade400,
                                          child: Container(
                                            color: Colors.grey.shade300,
                                            height: 50,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            height: 160,
                            color: Colors.cyan,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppCubit.get(context).brandAd[index]['image3']}',
                              fit: BoxFit.fill,
                              placeholder: (context, url) => GFShimmer(
                                showShimmerEffect: true,
                                mainColor: Colors.grey.shade500,
                                secondaryColor: Colors.grey.shade400,
                                child: Container(
                                  color: Colors.grey.shade300,
                                  height: 160,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ), // Container
                    ),
                  ],
                );
              },
              onPageChanged: (value) =>
                  AppCubit.get(context).pageViewBrandsChange(value),
            ),
          ),
          AppCubit.get(context).brandAd.isEmpty ? Container():
          DotIndicatorWidget(
            scrollPosition: AppCubit.get(context).scrollPositionBrand,
            dotCount: AppCubit.get(context).brandAd.length,
          ),
        ],
      ),
    );
  }
}
