class CategoryModel {
  String? categoryName;
  bool? childStatus;
  String? path;
  String? image;
  String? dominantColor;
  String? icon;
  String? dominantColorIcon;
  List<CategoryModel>? subCategories;

  CategoryModel({
    this.categoryName,
    this.childStatus,
    this.path,
    this.image,
    this.dominantColor,
    this.icon,
    this.dominantColorIcon,
    this.subCategories,
  });
}
