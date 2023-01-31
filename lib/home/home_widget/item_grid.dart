import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

import '../../rec/images_manager/images_manager.dart';
import 'image_container.dart';
import 'offer_container_widget.dart';

class ItemGrid extends StatelessWidget {
  final String imagePath;
  final String? offer;
  final String? description;
  final String? itemPriceAfterDiscount;
  final String? itemPriceBeforeDiscount;
  final bool? isFavouriteItem;
  final double? imageWidth;
  final double? imageHeight;
  final bool? isHomeItem;

  final Function()? onFavouriteClick;
  final Function()? onAddToCartClick;

  const ItemGrid(
      {Key? key,
      required this.imagePath,
      required this.offer,
      required this.description,
      required this.itemPriceAfterDiscount,
      required this.itemPriceBeforeDiscount,
      this.onFavouriteClick,
      this.isFavouriteItem = false,
      this.onAddToCartClick,
      this.imageHeight = 130,
      this.imageWidth = double.infinity,
      this.isHomeItem = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 3, child: _itemImageWithFavoriteAndOffer()),
            _textOfDescription(),
            _rowIfPriceAndCart(),
          ],
        ),
      ),
    );
  }

  Widget _itemImageWithFavoriteAndOffer() {
    return Stack(
      children: [
        ImageContainer(
          width: imageWidth!,
          height: imageHeight!,
          imagePath: imagePath,
          placeHolderPath: ImagesManager.placeholder,
        ),
        _favoriteAndOffer()
      ],
    );
  }

  Widget _favoriteAndOffer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(7),
            child: BouncingWidget(
              duration: const Duration(milliseconds: 200),
              scaleFactor: 2.5,
              onPressed: () => onFavouriteClick!(),
              child: isFavouriteItem ?? true
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      color: Colors.green,
                    ),
            ),
          ),
        ),
        Visibility(
          visible: offer != "0",
          child: Align(
            alignment: Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {},
              child: OfferContainerWidget(
                offer: offer,
                isOfferVisible: _isOfferContainerVisible(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textOfDescription() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        description!,
        textAlign: TextAlign.start,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _rowIfPriceAndCart() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _priceWithCurrency(),
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: Visibility(
            visible: itemPriceBeforeDiscount!.isNotEmpty,
            child: Text(
              itemPriceBeforeDiscount!,
              style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 13),
            ),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        BouncingWidget(
          duration: const Duration(milliseconds: 200),
          scaleFactor: 2.5,
          onPressed: () => onAddToCartClick!(),
          child: const Icon(
            Icons.shopping_cart_outlined,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  String _priceWithCurrency() {
    return itemPriceAfterDiscount!;
  }

  bool _isOfferContainerVisible() {
    if (offer!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
