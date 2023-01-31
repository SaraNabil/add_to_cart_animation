import 'home_product_item_model.dart';

class HomeProductModel {
  String? productTitle;
  List<HomeProductItemModel>? homProductItemsListModel;

  HomeProductModel({
    this.homProductItemsListModel,
    this.productTitle,
  });
}
