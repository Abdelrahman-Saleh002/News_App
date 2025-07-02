import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/utils/app_colors.dart';

import 'category/category_fragment.dart';
import 'category/source_details.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(
          onDrawerItemClicked: onDrawerItemClicked,
        ),
      ),
      body: selectedCategory == null
          ? CategoryFragment(
              onViewAllClicked: onViewAllClicked,
            )
          : CategoryDetails(
              category: selectedCategory!,
            ),
    );
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory) {
    //todo: newSelectedCategory => user select
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void onDrawerItemClicked() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
