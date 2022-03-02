import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mv_customet_app/services/firebase_service.dart';

class MainCategory {
  MainCategory({required this.category, required this.mainCategory});

  MainCategory.fromJson(Map<String, Object?> json)
      : this(
    category: json['category']! as String,
    mainCategory: json['mainCategory']! as String,
  );

  final String category;
  final String mainCategory;

  Map<String, Object?> toJson() {
    return {
      'category': category,
      'image': mainCategory,
    };
  }
}
FirebaseService service=FirebaseService();
final mainCategoryCollection = service.mainCategories.where('approved',isEqualTo: true).withConverter<MainCategory>(
  fromFirestore: (snapshot, _) => MainCategory.fromJson(snapshot.data()!),
  toFirestore: (mainCategory, _) => mainCategory.toJson(),
);