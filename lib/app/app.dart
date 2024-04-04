import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/domain_layer/shopping_repository.dart';
import 'package:shopping_cart/feature_layer/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/feature_layer/cart/view/cart_page.dart';
import 'package:shopping_cart/feature_layer/catalog/bloc/catalog_bloc.dart';
import 'package:shopping_cart/feature_layer/catalog/view/catalog_page.dart';
 

class App extends StatelessWidget {
  const App({required this.shoppingRepository, super.key});

  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Shopping Cart',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const CatalogPage(),
          '/cart': (_) => const CartPage(),
        },
      ),
    );
  }
}
