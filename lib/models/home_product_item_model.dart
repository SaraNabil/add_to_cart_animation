class HomeProductItemModel {
  String? productItemId;
  String? productItemImage;
  String? productItemName;
  String? productItemPrice;
  int? productItemQuantity;
  String? productItemSpecial;
  int? productItemRating;
  String? productItemReviews;
  bool? productItemHasOptions;
  bool? productItemHasIsFavorite;
  String? productItemOffer;

  HomeProductItemModel(
      {this.productItemHasIsFavorite,
      this.productItemHasOptions,
      this.productItemId,
      this.productItemImage,
      this.productItemName,
      this.productItemPrice,
      this.productItemQuantity,
      this.productItemReviews,
      this.productItemRating,
      this.productItemSpecial,
      this.productItemOffer});
}
