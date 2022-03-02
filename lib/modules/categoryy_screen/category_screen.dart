import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/layout/cubit/states.dart';
import 'package:mv_customet_app/models/category_model.dart';
import 'package:mv_customet_app/shared/styles/color.dart';
import 'package:mv_customet_app/widget/home_screen_widget/banner_widget.dart';
import 'package:mv_customet_app/widget/home_screen_widget/brands_heightlight_widget.dart';
import 'package:mv_customet_app/widget/home_screen_widget/category_widget.dart';
import 'package:mv_customet_app/widget/home_screen_widget/search_widget.dart';

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        String title = 'Categories';
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.selectedCategory ?? title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            elevation: 0.0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black54),
            actions: [
              IconButton(
                icon: Icon(IconlyLight.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(IconlyLight.buy),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Row(
            children: [
              Container(
                width: 80,
                color: Colors.grey.shade400,
                child: FirestoreListView<Category>(
                  query: categoryCollection,
                  itemBuilder: (context, snapshot) {
                    Category category = snapshot.data();
                    return InkWell(
                      onTap: () {
                        cubit.changeCategoryLabel(category.catName);
                      },
                      child: Container(
                        height: 70,
                        color:  cubit.selectedCategory == category.catName?Colors.white:Colors.grey.shade300,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  child: CachedNetworkImage(
                                    imageUrl: category.image,
                                  ),
                                  height:
                                      cubit.selectedCategory == category.catName
                                          ? 30
                                          : 25,
                                ),
                                Text(
                                  category.catName,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight:  cubit.selectedCategory == category.catName
                                        ? FontWeight.bold:FontWeight.normal,
                                    color: cubit.selectedCategory == category.catName
                                        ? defaultColor
                                        : Colors.grey.shade700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
