class CategoryModel {
  final String? categoryName;
  final bool? childStatus;
  final String? path;
  final String? image;
  final String? dominantColor;
  final String? icon;
  final String? dominantColorIcon;
  final List<CategoryModel>? subCategories;

  const CategoryModel({
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
