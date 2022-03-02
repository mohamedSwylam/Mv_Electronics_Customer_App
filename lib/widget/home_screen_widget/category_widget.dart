import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:mv_customet_app/layout/cubit/cubit.dart';
import 'package:mv_customet_app/models/category_model.dart';

class CategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 18,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Stores For You',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8,0,8,8),
            child: SizedBox(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: FirestoreListView<Category>(
                      scrollDirection: Axis.horizontal,
                      query: categoryCollection,
                      itemBuilder: (context, snapshot) {
                        Category category = snapshot.data();
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: ActionChip(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              backgroundColor: Colors.grey,
                              label: Text(
                                category.catName,
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              onPressed:() {

                              }
                          ),
                        );
                      },
                    ),
                    /*ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cubit.categoryLabel.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: ActionChip(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              backgroundColor: cubit.categoryIndex == index
                                  ? Colors.blue.shade900
                                  : Colors.grey,
                              label: Text(
                                cubit.categoryLabel[index],
                                style: TextStyle(
                                    fontSize: 12,
                                    color: cubit.categoryIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              onPressed:() {
                                cubit.changeCategoryLabel(index);
                              }
                            ),
                          );
                        }),*/
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(IconlyLight.arrowDown),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
