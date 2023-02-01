import 'category_model.dart';
import 'home_products_model.dart';

class HomeResponseModel {
  final List<HomeProductModel>? homeProductsList;
  final List<CategoryModel>? homeCategoryList;
  final String? minCartValue;

  const HomeResponseModel({
    this.homeCategoryList,
    this.homeProductsList,
    this.minCartValue,
  });
}
