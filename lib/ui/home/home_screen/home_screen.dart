import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../bloc/home_bloc.dart';
import '../../../data/data_source.dart';
import '../../../provider/cart_counter_provider.dart';
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
      homeResponseModel: DataSource.homeResponseModel,
      isFavouriteItem: true,
      scrollController: scrollController,
      scrollVisibility: scrollVisibility,
      imagePath: _imagePath,
      showLoader: _showLoader,
      isScaleVisible: _isScaleVisible,
      scaleController: _scaleController,
      relativeRectTween: _relativeRectTween,
      animationController: _animationController,
      sliderImages: DataSource.sliderImages,
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
