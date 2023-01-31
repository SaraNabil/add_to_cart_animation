import 'package:flutter/material.dart';

class CartCounterProvider extends ChangeNotifier {
  double _quantity = 0.0;

  int get quantity => _quantity.toInt();

  updateQuantity(double q) {
    _quantity = q;
    notifyListeners();
  }
}
