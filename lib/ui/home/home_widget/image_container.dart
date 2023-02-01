import 'package:add_to_cart_animation/rec/images_manager/images_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double width;
  final double height;
  final String imagePath;
  final String placeHolderPath;

  const ImageContainer({
    super.key,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.placeHolderPath,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: CachedNetworkImage(
            imageUrl: imagePath,
            placeholder: (context, url) => Center(
              child: Image.asset(
                ImagesManager.loading,
                width: width,
                height: height,
                fit: BoxFit.fill,
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              placeHolderPath,
              width: width,
              height: height,
              fit: BoxFit.cover,
            ),
            imageBuilder: (context, imageProvider) => Image(
              image: imageProvider,
              width: width,
              height: height,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                placeHolderPath,
                width: width,
                height: height,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ));
  }
}
