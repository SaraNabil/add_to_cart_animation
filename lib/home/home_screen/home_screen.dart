import 'package:add_to_cart_animation/models/category_model.dart';
import 'package:add_to_cart_animation/models/home_product_item_model.dart';
import 'package:add_to_cart_animation/models/home_products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../models/home_response.dart';
import '../../provider/cart_counter_provider.dart';
import '../bloc/home_bloc.dart';
import '../home_widget/build_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();

  late AnimationController _animationController;
  late AnimationController _scaleController;
  bool scrollVisibility = true;
  CartCounterProvider? _cartCounterProvider;
  bool _isScaleVisible = false, _showLoader = false;
  String _imagePath = '';

  final List<String> _sliderImages = [
    'https://s3-ap-south-1.amazonaws.com/blogmindler/bloglive/wp-content/uploads/2021/07/21185633/Interesting-Facts-about-Electronics-and-Communication-Engineering_blog-770x385.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH_Y9jf-E16ILDPpIzCX8zLYBm-uLctGHAyg&usqp=CAU',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/nyfwsketches-1567608885.jpg?crop=0.502xw:1.00xh;0.251xw,0&resize=640:*',
    'https://www.modernretail.co/wp-content/uploads/sites/5/2021/07/Modern-Retail-Illustration-01-scaled.jpg',
  ];
  final HomeResponseModel _homeResponseModel = HomeResponseModel(
    homeCategoryList: [
      CategoryModel(categoryName: 'Electronics'),
      CategoryModel(categoryName: 'Cosmetics'),
      CategoryModel(categoryName: 'Fashion'),
      CategoryModel(categoryName: 'Sport'),
      CategoryModel(categoryName: 'Health'),
    ],
    homeProductsList: [
      HomeProductModel(
        homProductItemsListModel: [
          HomeProductItemModel(
            productItemHasIsFavorite: true,
            productItemHasOptions: false,
            productItemId: '1',
            productItemImage:
                'https://e7.pngegg.com/pngimages/800/586/png-clipart-green-desk-calculator-cartoon-illustration-calculator-supplies-electronics.png',
            productItemName: 'Calculator',
            productItemOffer: '50%',
            productItemPrice: '100\$',
            productItemQuantity: 10,
            productItemRating: 4,
            productItemReviews: '5',
            productItemSpecial: '50\$',
          ),
          HomeProductItemModel(
            productItemHasIsFavorite: false,
            productItemHasOptions: false,
            productItemId: '2',
            productItemImage:
                'https://png.pngtree.com/element_our/20190602/ourlarge/pngtree-a-laptop-illustration-image_1404936.jpg',
            productItemName: 'Laptop',
            productItemOffer: '',
            productItemPrice: '150\$',
            productItemQuantity: 10,
            productItemRating: 4,
            productItemReviews: '5',
            productItemSpecial: '',
          ),
          HomeProductItemModel(
            productItemHasIsFavorite: true,
            productItemHasOptions: false,
            productItemId: '3',
            productItemImage:
                'https://w7.pngwing.com/pngs/637/673/png-transparent-white-iphone-4-illustration-iphone-x-smartphone-google-s-smartphone-line-drawing-angle-white-electronics.png',
            productItemName: 'iPhone',
            productItemOffer: '',
            productItemPrice: '100\$',
            productItemQuantity: 10,
            productItemRating: 4,
            productItemReviews: '5',
            productItemSpecial: '6',
          ),
          HomeProductItemModel(
            productItemHasIsFavorite: true,
            productItemHasOptions: false,
            productItemId: '4',
            productItemImage:
                'https://w7.pngwing.com/pngs/665/330/png-transparent-drawing-illustration-illustration-sketch-headphones-electronics-photography-illustrator.png',
            productItemName: 'Headphone',
            productItemOffer: '20%',
            productItemPrice: '100\$',
            productItemQuantity: 10,
            productItemRating: 4,
            productItemReviews: '5',
            productItemSpecial: '80',
          ),
        ],
        productTitle: 'Electronics',
      ),
    ],
    minCartValue: '0',
  );
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _scaleController = AnimationController(
      duration: const Duration(
        seconds: 1,
      ),
      vsync: this,
      value: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    _cartCounterProvider =
        Provider.of<CartCounterProvider>(context, listen: true);

    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AddToCartState) {
          _addToCart(state.image);
          _cartCounterProvider!
              .updateQuantity(_cartCounterProvider!.quantity.toInt() + 1);
        } else if (state is ShowLoadingState) {
          setState(() {
            _showLoader = true;
          });
          Future.delayed(const Duration(seconds: 2)).then((value) =>
              BlocProvider.of<HomeBloc>(context)
                  .add(AddToCartEvent(state.image)));
        }
      },
      builder: (context, state) {
        return _homeBody();
      },
    );
  }

  Widget _homeBody() {
    return BuildHomeScreen(
      homeResponseModel: _homeResponseModel,
      isFavouriteItem: true,
      scrollController: scrollController,
      scrollVisibility: scrollVisibility,
      imagePath: _imagePath,
      showLoader: _showLoader,
      isScaleVisible: _isScaleVisible,
      scaleController: _scaleController,
      relativeRectTween: _relativeRectTween,
      animationController: _animationController,
      sliderImages: _sliderImages,
    );
  }

  final RelativeRectTween _relativeRectTween = RelativeRectTween(
    begin: const RelativeRect.fromLTRB(0, 80, 0, 0),
    end: const RelativeRect.fromLTRB(400, 1000, 130, 0),
  );

  _addToCart(image) {
    setState(() {
      _showLoader = false;
      _isScaleVisible = true;
      _imagePath = image;
    });
    _animationController.forward().then((value) {
      _animationController.reverse();
      setState(() {
        _isScaleVisible = false;
      });
    });
  }
}
