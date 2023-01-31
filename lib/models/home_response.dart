import 'category_model.dart';
import 'home_products_model.dart';

class HomeResponseModel {
  List<HomeProductModel>? homeProductsList;
  List<CategoryModel>? homeCategoryList;
  String? minCartValue;

  HomeResponseModel({
    this.homeCategoryList,
    this.homeProductsList,
    this.minCartValue,
  });
}
