import 'package:flutter/material.dart';

class TitleOfTheSectionWidget extends StatelessWidget {
  final String title;

  const TitleOfTheSectionWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23,
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
