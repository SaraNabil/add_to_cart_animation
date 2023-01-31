import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../rec/images_manager/images_manager.dart';

class HomeSlider extends StatefulWidget {
  final List<String>? imagesList;

  const HomeSlider({Key? key, this.imagesList}) : super(key: key);

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider>
    with AutomaticKeepAliveClientMixin {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 24),
      width: double.infinity,
      height: 150,
      child: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: _mapListOfImages(),
            carouselController: _controller,
            options: CarouselOptions(
                height: MediaQuery.of(context).size.width,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                pauseAutoPlayOnTouch: true,
                viewportFraction: 1,
                pageSnapping: true,
                disableCenter: true,
                enableInfiniteScroll: true,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imagesList!.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _indicatorColor(entry),
                ),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }

  List<Widget> _mapListOfImages() {
    return widget.imagesList!
        .map(
          (item) => ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: MediaQuery.of(context).size.width,
                  child: CachedNetworkImage(
                    imageUrl: item,
                    placeholder: (context, url) => Image.asset(
                      ImagesManager.loading,
                      height: 100,
                    ),
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        ImagesManager.placeholder,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // ),
              ],
            ),
          ),
        )
        .toList();
  }

  Color _indicatorColor(var entry) {
    if (_current == entry!.key) {
      return Colors.amber;
    } else {
      return Colors.grey;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
