import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/app/app.dart';
import 'package:shopping_cart/app/simple_bloc_observer.dart';
import 'package:shopping_cart/domain_layer/shopping_repository.dart';

void main() {
  Bloc.observer = const SimpleBlocObserver();
  runApp(App(shoppingRepository: ShoppingRepository()));
}
