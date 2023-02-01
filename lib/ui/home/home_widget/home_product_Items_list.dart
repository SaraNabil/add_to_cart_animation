import 'package:flutter/material.dart';

import '../../../models/home_response.dart';
import 'home_list_item.dart';

class HomeProductItemsListWidget extends StatelessWidget {
  final int? productTypeIndex;
  final HomeResponseModel? homeModel;
  final bool? isFavouriteItem;

  const HomeProductItemsListWidget(
      {Key? key, this.productTypeIndex, this.homeModel, this.isFavouriteItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
        color: Colors.grey[200],
        height: 250,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 23,
                  child: Text(_handleTitle(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: homeModel?.homeProductsList?[productTypeIndex!]
                      .homProductItemsListModel!.length,
                  itemBuilder: (context, index) => HomeListItemWidget(
                      listItemIndex: index,
                      productTypeIndex: productTypeIndex,
                      isFavouriteItem: isFavouriteItem,
                      homeProductModel:
                          homeModel?.homeProductsList![productTypeIndex!])),
            )
          ],
        ),
      ),
    );
  }

  String _handleTitle() =>
      homeModel!.homeProductsList![productTypeIndex!].productTitle!
          .toUpperCase();
}
