import 'package:flutter/material.dart';

import '../../../models/home_response.dart';
import 'home_product_Items_list.dart';

class HomeProductsListWidget extends StatelessWidget {
  final HomeResponseModel? homeModel;
  final bool? isFavouriteItem;
  final ScrollController? scrollController;

  const HomeProductsListWidget({
    Key? key,
    this.homeModel,
    this.scrollController,
    this.isFavouriteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          color: Colors.grey[200],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            controller: scrollController,
            itemCount: homeModel?.homeProductsList?.length,
            itemBuilder: (context, index) => Container(
              padding: lastItemPadding(
                  index, homeModel?.homeProductsList?.length ?? 0),
              child: HomeProductItemsListWidget(
                productTypeIndex: index,
                homeModel: homeModel,
                isFavouriteItem: isFavouriteItem,
              ),
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsetsGeometry lastItemPadding(int index, int length) =>
      index == length - 1.0
          ? const EdgeInsets.only(bottom: 80)
          : const EdgeInsets.all(0);
}
