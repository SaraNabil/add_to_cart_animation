import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home_screen/home_screen.dart';
import '../provider/cart_counter_provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<BottomNavigationBarScreen> {
  CartCounterProvider? cartCounterChangeProvider;

  @override
  Widget build(BuildContext context) {
    cartCounterChangeProvider =
        Provider.of<CartCounterProvider>(context, listen: true);
    return Scaffold(
      body: const HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: _navBarsItems(),
        selectedFontSize: 14,
        selectedItemColor: Colors.green,
        unselectedFontSize: 14,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.dashboard),
        activeIcon: Icon(Icons.dashboard_customize),
        label: 'Categories',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined),
        activeIcon: Icon(Icons.shopping_bag),
        label: 'Shops',
      ),
      BottomNavigationBarItem(
        icon: cartCounterChangeProvider!.quantity != 0
            ? _badgeWidget(
                cartCounterChangeProvider!.quantity,
                Icons.shopping_cart,
              )
            : Icon(Icons.shopping_cart_outlined),
        activeIcon: Icon(Icons.shopping_cart),
        label: 'Cart',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: 'My Profile',
      ),
    ];
  }

  // List<PersistentBottomNavBarItem> _navBarsItems() {
  //   return [
  //     _bottomNavItem(
  //       Icons.home,
  //       Icons.home_outlined,
  //       'Home',
  //     ),
  //     _bottomNavItem(
  //       Icons.dashboard_customize,
  //       Icons.dashboard,
  //       'Categories',
  //     ),
  //     _bottomNavItem(
  //       Icons.shopping_bag,
  //       Icons.shopping_bag_outlined,
  //       'Shops',
  //     ),
  //     _bottomNavItem(
  //       Icons.shopping_cart,
  //       Icons.shopping_cart_outlined,
  //       'Cart',
  //     ),
  //     _bottomNavItem(
  //       Icons.person,
  //       Icons.person_outline,
  //       'My Profile',
  //     ),
  //   ];
  // }
  //
  // PersistentBottomNavBarItem _bottomNavItem(
  //   IconData activeIconPath,
  //   IconData inactiveIconPath,
  //   String title,
  // ) {
  //   return PersistentBottomNavBarItem(
  //     icon: title == 'Cart'
  //         ? _badgeWidget(
  //             5,
  //             activeIconPath,
  //           )
  //         : Icon(
  //             inactiveIconPath,
  //             size: 24,
  //           ),
  //     inactiveIcon: title == 'Cart'
  //         ? _badgeWidget(
  //             5,
  //             inactiveIconPath,
  //           )
  //         : Icon(
  //             inactiveIconPath,
  //             size: 24,
  //           ),
  //     title: title,
  //     activeColorPrimary: Colors.green,
  //     inactiveColorPrimary: Colors.grey,
  //   );
  // }

  Widget _badgeWidget(int quantity, IconData imgPath) {
    return Badge(
      badgeContent: Text(
        '$quantity',
        style: const TextStyle(fontSize: 10, color: Colors.white),
      ),
      child: Icon(
        imgPath,
        size: 24,
      ),
    );
  }
}
