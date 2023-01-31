import 'package:flutter/material.dart';

import '../../models/home_response.dart';
import '../../rec/images_manager/images_manager.dart';
import 'add_to_cart_loader.dart';
import 'home_list_of_categories.dart';
import 'home_products_list.dart';
import 'home_search_bar.dart';
import 'home_slider.dart';
import 'home_title_of_the_section_widget.dart';
import 'image_container.dart';

class BuildHomeScreen extends StatelessWidget {
  final HomeResponseModel? homeResponseModel;
  final bool? isFavouriteItem;
  final bool? scrollVisibility;
  final ScrollController? scrollController;
  final bool? isScaleVisible;
  final bool? showLoader;
  final String? imagePath;
  final AnimationController? scaleController;
  final RelativeRectTween? relativeRectTween;
  final AnimationController? animationController;
  final List<String> sliderImages;
  const BuildHomeScreen({
    Key? key,
    this.homeResponseModel,
    this.isFavouriteItem,
    this.scrollVisibility,
    this.scrollController,
    this.isScaleVisible,
    this.showLoader,
    this.imagePath,
    this.scaleController,
    this.relativeRectTween,
    this.animationController,
    required this.sliderImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const HomeSearchBar(),
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    child: Visibility(
                      visible: scrollVisibility!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HomeSlider(imagesList: sliderImages),
                          const Padding(
                            padding: EdgeInsets.only(left: 16, right: 16),
                            child: TitleOfTheSectionWidget(title: 'Categories'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListOfCategories(
                    homeCategoryModels: homeResponseModel!.homeCategoryList!,
                    scrollVisibility: scrollVisibility,
                  ),
                  Expanded(
                      child: HomeProductsListWidget(
                    scrollController: scrollController,
                    homeModel: homeResponseModel,
                    isFavouriteItem: isFavouriteItem,
                  )),
                ],
              ),
              Visibility(
                visible: showLoader!,
                child: const AddToCartLoader(),
              ),
              Visibility(
                  visible: isScaleVisible!,
                  child: PositionedTransition(
                    rect: relativeRectTween!.animate(animationController!),
                    child: ScaleTransition(
                      scale: scaleController!,
                      child: ImageContainer(
                        width: 200,
                        height: 150,
                        imagePath: imagePath!,
                        placeHolderPath: ImagesManager.placeholder,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
