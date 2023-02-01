import 'package:flutter/material.dart';

import '../../../rec/images_manager/images_manager.dart';

class AddToCartLoader extends StatelessWidget {
  const AddToCartLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black12,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              ImagesManager.addToCartLoader,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
