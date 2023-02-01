import 'package:flutter/material.dart';

import '../../../models/category_model.dart';
import 'home_category_item.dart';

class ListOfCategories extends StatelessWidget {
  final bool? scrollVisibility;
  final List<CategoryModel> homeCategoryModels;

  const ListOfCategories({
    Key? key,
    this.scrollVisibility,
    required this.homeCategoryModels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: _listOfCategories(context),
    );
  }

  Widget _listOfCategories(BuildContext context) {
    return Container(
      height: scrollVisibility! ? 120 : 50,
      alignment: Alignment.center,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CategoryItem(
            homeCategoryModel: homeCategoryModels[index],
            scrollVisibility: scrollVisibility,
          );
        },
      ),
    );
  }
}
