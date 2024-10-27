import 'package:market/src/feature/home/domain/model/home_model.dart';

class HeroTag {
  static String image(String urlImage) => urlImage;

  static String addressLine1(HomeModel homemodel) =>
      homemodel.name + homemodel.description;

  static String addressLine2(HomeModel homemodel) =>
      homemodel.name + homemodel.company;

  static String stars(HomeModel homemodel) =>
      homemodel.name + homemodel.sales.toString();

  // تعديل في العلامة لتشمل الـ index لضمان التفرد
  static String avatar(HomeModel review, int index) {
    if (index >= 0 && index < review.images.length) {
      return '${review.images[index]}_$index'; // إضافة '_$index' لتمييز العلامة
    } else {
      return ''; // إذا لم يكن هناك صورة في هذا الموقع
    }
  }
}
