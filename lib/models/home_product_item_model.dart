class HomeProductItemModel {
  final String? productItemId;
  final String? productItemImage;
  final String? productItemName;
  final String? productItemPrice;
  final int? productItemQuantity;
  final String? productItemSpecial;
  final int? productItemRating;
  final String? productItemReviews;
  final bool? productItemHasOptions;
  final bool? productItemHasIsFavorite;
  final String? productItemOffer;

  const HomeProductItemModel(
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
