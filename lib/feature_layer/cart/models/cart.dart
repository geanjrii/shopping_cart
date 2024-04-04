import 'package:equatable/equatable.dart';
import 'package:shopping_cart/feature_layer/catalog/models/item.dart';

class Cart extends Equatable {
  const Cart({this.items = const <Item>[]});

  final List<Item> items;

  int get totalPrice {
    return items.fold(0, (total, current) => total + current.price);
  }

  @override
  List<Object> get props => [items];
}
