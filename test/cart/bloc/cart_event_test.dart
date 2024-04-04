// ignore_for_file: prefer_const_constructors
 
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/feature_layer/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/feature_layer/catalog/models/item.dart';

class FakeItem extends Fake implements Item {}

void main() {
  group('CartEvent', () {
    group('CartStarted', () {
      test('supports value comparison', () {
        expect(CartStarted(), CartStarted());
      });
    });

    group('CartItemAdded', () {
      final item = FakeItem();
      test('supports value comparison', () {
        expect(CartItemAdded(item as Item), CartItemAdded(item));
      });
    });

    group('CartItemRemoved', () {
      final item = FakeItem();
      test('supports value comparison', () {
        expect(CartItemRemoved(item), CartItemRemoved(item));
      });
    });
  });
}
