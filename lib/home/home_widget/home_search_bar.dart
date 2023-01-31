import 'package:flutter/material.dart';

import '../../rec/images_manager/images_manager.dart';
import 'search_bar_text_field.dart';

class HomeSearchBar extends StatelessWidget with PreferredSizeWidget {
  const HomeSearchBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Image.asset(
            ImagesManager.logo,
            width: 70,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: SearchBarTextField(
              isEnableWriting: false,
              hint: 'What are you looking for ?',
            ),
          ),
        ],
      ),
    );
  }
}
