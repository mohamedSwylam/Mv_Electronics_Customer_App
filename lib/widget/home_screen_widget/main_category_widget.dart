import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/models/category_model.dart';
import 'package:mv_customet_app/models/main_category_model.dart';
import 'package:mv_customet_app/shared/styles/color.dart';

class MainCategoryWidget extends StatefulWidget {
  final String? selectedCat;

  const MainCategoryWidget({Key? key,this.selectedCat}) : super(key: key);

  @override
  State<MainCategoryWidget> createState() => _MainCategoryWidgetState();
}

class _MainCategoryWidgetState extends State<MainCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Expanded(
      child: FirestoreListView<MainCategory>(
        query: mainCategoryCollection(widget.selectedCat),
        itemBuilder: (context, snapshot) {
          MainCategory mainCategory = snapshot.data();
          return ExpansionTile(title: Text(mainCategory.mainCategory));
        },
      ),
    );
  }
}
