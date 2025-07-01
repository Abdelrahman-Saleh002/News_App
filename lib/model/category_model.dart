import 'package:news/utils/assets_manager.dart';

class CategoryModel {
  String id;

  String title;

  String imagePath;

  CategoryModel(
      {required this.id, required this.title, required this.imagePath});

  static List<CategoryModel> getCategoriesList(bool isDark) {
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          imagePath: isDark
              ? AssetsManager.sportsLightImage
              : AssetsManager.sportsDarkImage),
      CategoryModel(
          id: 'business',
          title: 'Business',
          imagePath: isDark
              ? AssetsManager.businessLightImage
              : AssetsManager.businessDarkImage),
      CategoryModel(
          id: 'entertainment',
          title: 'Entertainment',
          imagePath: isDark
              ? AssetsManager.entertainmentLightImage
              : AssetsManager.entertainmentDarkImage),
      CategoryModel(
          id: 'health',
          title: 'Health',
          imagePath: isDark
              ? AssetsManager.healthLightImage
              : AssetsManager.healthDarkImage),
      CategoryModel(
          id: 'general',
          title: 'General',
          imagePath: isDark
              ? AssetsManager.generalLightImage
              : AssetsManager.generalDarkImage),
      CategoryModel(
          id: 'technology',
          title: 'Technology',
          imagePath: isDark
              ? AssetsManager.technologyLightImage
              : AssetsManager.technologyDarkImage),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imagePath: isDark
              ? AssetsManager.scienceLightImage
              : AssetsManager.scienceDarkImage),
    ];
  }
}
