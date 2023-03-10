import 'package:add_to_cart_animation/ui/bottom_navigation_bar/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/home_bloc.dart';
import 'provider/cart_counter_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartCounterProvider>(
      create: (context) => CartCounterProvider(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Add to cart animation',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const BottomNavigationBarScreen(),
        ),
      ),
    );
  }
}
