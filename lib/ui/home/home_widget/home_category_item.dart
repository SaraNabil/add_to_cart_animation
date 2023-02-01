import 'package:flutter/material.dart';

import '../../../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel homeCategoryModel;
  final bool? scrollVisibility;

  const CategoryItem({
    Key? key,
    required this.homeCategoryModel,
    this.scrollVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2),
      width: 80,
      child: Column(
        children: [
          const SizedBox(height: 5),
          Visibility(visible: scrollVisibility!, child: _circleCategoryImage()),
          const SizedBox(height: 5),
          _categoryNameText(),
        ],
      ),
    );
  }

  Widget _circleCategoryImage() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.white),
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 0), // shadow direction: bottom right
          )
        ],
      ),
      child: const Center(
        child: Icon(
          Icons.dashboard,
          size: 24,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _categoryNameText() {
    return Expanded(
      child: Text(
        homeCategoryModel.categoryName!,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
