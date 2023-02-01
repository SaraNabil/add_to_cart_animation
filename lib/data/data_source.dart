import 'package:add_to_cart_animation/models/category_model.dart';

import '../models/home_product_item_model.dart';
import '../models/home_products_model.dart';
import '../models/home_response.dart';

class DataSource {
  static const List<String> sliderImages = [
    'https://s3-ap-south-1.amazonaws.com/blogmindler/bloglive/wp-content/uploads/2021/07/21185633/Interesting-Facts-about-Electronics-and-Communication-Engineering_blog-770x385.png',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTH_Y9jf-E16ILDPpIzCX8zLYBm-uLctGHAyg&usqp=CAU',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/nyfwsketches-1567608885.jpg?crop=0.502xw:1.00xh;0.251xw,0&resize=640:*',
    'https://www.modernretail.co/wp-content/uploads/sites/5/2021/07/Modern-Retail-Illustration-01-scaled.jpg',
  ];
  static const HomeResponseModel homeResponseModel = HomeResponseModel(
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
}
