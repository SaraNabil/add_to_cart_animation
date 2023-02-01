import 'home_product_item_model.dart';

class HomeProductModel {
  final String? productTitle;
  final List<HomeProductItemModel>? homProductItemsListModel;

  const HomeProductModel({
    this.homProductItemsListModel,
    this.productTitle,
  });
}
