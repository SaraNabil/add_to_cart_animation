import 'package:add_to_cart_animation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/home_products_model.dart';
import 'item_grid.dart';

class HomeListItemWidget extends StatefulWidget {
  final int? listItemIndex;
  final HomeProductModel? homeProductModel;
  final bool? isFavouriteItem;
  final int? productTypeIndex;

  const HomeListItemWidget(
      {Key? key,
      this.listItemIndex,
      this.homeProductModel,
      this.isFavouriteItem,
      this.productTypeIndex})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeListItemWidgetState();
}

class _HomeListItemWidgetState extends State<HomeListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ItemGrid(
      itemPriceAfterDiscount: _handleAfterPrice(widget.homeProductModel!
          .homProductItemsListModel![widget.listItemIndex!].productItemSpecial
          .toString()),
      imagePath: widget
              .homeProductModel!
              .homProductItemsListModel![widget.listItemIndex!]
              .productItemImage ??
          '',
      description: widget
              .homeProductModel!
              .homProductItemsListModel![widget.listItemIndex!]
              .productItemName ??
          '',
      itemPriceBeforeDiscount: _handleBeforePrice(widget.homeProductModel!
          .homProductItemsListModel![widget.listItemIndex!].productItemSpecial
          .toString()),
      offer: widget
              .homeProductModel!
              .homProductItemsListModel![widget.listItemIndex!]
              .productItemOffer ??
          '',
      onFavouriteClick: () {},
      onAddToCartClick: () => _onToCartClick(),
      isFavouriteItem: widget
              .homeProductModel!
              .homProductItemsListModel![widget.listItemIndex!]
              .productItemHasIsFavorite ??
          false,
    );
  }

  void _onToCartClick() {
    //todo add to cart
    BlocProvider.of<HomeBloc>(context).add(
      ShowLoadingEvent(widget
              .homeProductModel
              ?.homProductItemsListModel![widget.listItemIndex!]
              .productItemImage ??
          ''),
    );
  }

  String? _handleAfterPrice(String? specialPrice) {
    if (specialPrice == "0.0000" || specialPrice == "") {
      return widget.homeProductModel
          ?.homProductItemsListModel![widget.listItemIndex!].productItemPrice;
    } else {
      return widget.homeProductModel
          ?.homProductItemsListModel![widget.listItemIndex!].productItemSpecial
          .toString();
    }
  }

  String? _handleBeforePrice(String? specialPrice) {
    if (specialPrice == "0.0000" || specialPrice!.isEmpty) {
      return "";
    } else {
      return widget.homeProductModel
          ?.homProductItemsListModel![widget.listItemIndex!].productItemPrice;
    }
  }
}
