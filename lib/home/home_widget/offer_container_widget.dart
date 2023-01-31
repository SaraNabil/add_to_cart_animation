import 'package:flutter/material.dart';

class OfferContainerWidget extends StatelessWidget {
  final String? offer;
  final bool? isOfferVisible;

  const OfferContainerWidget(
      {Key? key, this.offer, this.isOfferVisible = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isOfferVisible!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          offer!,
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
