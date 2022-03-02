import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/models/category_model.dart';
import 'package:mv_customet_app/models/main_category_model.dart';
import 'package:mv_customet_app/models/sub_category_model.dart';
import 'package:mv_customet_app/shared/styles/color.dart';

class SubCategoryWidget extends StatelessWidget {
  final String? selectedCat;

  const SubCategoryWidget({Key? key, this.selectedCat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return FirestoreQueryBuilder<SubCategory>(
      query: subCategoryCollection(selectedCat),
      builder: (context, snapshot, _) {
    if (snapshot.isFetching) {
      return const Center(child: CircularProgressIndicator());
    }
    if (snapshot.hasError) {
      return Text('error ${snapshot.error}');
    }

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: snapshot.docs.length==0 ? 1/1: 1/1.1,
      ),
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        SubCategory subCat = snapshot.docs[index].data();
        return InkWell(
          onTap: (){

          },
          child: Column(
            children: [
              SizedBox(
                height: 60,
                width: 60,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.network(subCat.image),
                ),
              ),
              Text(
                subCat.subCatName,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
      },
    );
  }
}
