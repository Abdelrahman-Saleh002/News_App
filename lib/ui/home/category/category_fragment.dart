import 'package:flutter/material.dart';
import 'package:news/model/category_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:news/utils/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CategoryFragment extends StatelessWidget {
  List<CategoryModel> categoriesList = [];
  Function onViewAllClicked;

  CategoryFragment({required this.onViewAllClicked});

  @override
  Widget build(BuildContext context) {
    categoriesList = CategoryModel.getCategoriesList(true);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: Theme
                .of(context)
                .textTheme
                .labelLarge,
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return SizedBox(
                height: height * 0.02,
              );
            },
            itemBuilder: (context, index) {
              return Stack(
                alignment: index % 2 == 0
                    ? Alignment.bottomRight
                    : Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(categoriesList[index].imagePath),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        bottom: height * 0.02,
                        right: width * 0.01,
                        left: width * 0.01),
                    child: ToggleSwitch(
                      customWidths: [width * 0.25, width * 0.14],
                      cornerRadius: 20.0,
                      activeBgColors: const [
                        [AppColors.blackColor],
                        [AppColors.greyColor]
                      ],
                      activeFgColor: Colors.white,
                      inactiveBgColor: AppColors.greyColor,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: 1,
                      totalSwitches: 2,
                      customWidgets: [
                        Text(
                          'View All',
                          style: AppStyles.bold16White,
                        ),
                        const CircleAvatar(
                          backgroundColor: AppColors.blackColor,
                          // radius: 70,
                          child: Icon(
                              color: AppColors.whiteColor,
                              Icons.arrow_forward_ios_outlined),
                        )
                      ],
                      animate: true,
                      radiusStyle: true,
                      onToggle: (index1) {
                        print('switched to: $index');
                        onViewAllClicked(categoriesList[index]);
                      },
                    ),
                  ),
                ],
              );
            },
            itemCount: categoriesList.length,
          ))
        ],
      ),
    );
  }
}
