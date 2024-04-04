// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/feature_layer/catalog/models/catalog.dart';
import 'package:shopping_cart/feature_layer/catalog/models/item.dart';

void main() {
  group('Catalog', () {
    const mockItemNames = ['Orange Juice', 'Milk', 'Macaroons', 'Cookies'];

    test('supports value comparison', () async {
      expect(
        Catalog(itemNames: mockItemNames),
        Catalog(itemNames: mockItemNames),
      );
    });

    test('gets correct item by id', () async {
      expect(
        Catalog(itemNames: mockItemNames).getById(1),
        Item(1, 'Milk'),
      );
    });

    test('gets correct item by id', () async {
      expect(
        Catalog(itemNames: mockItemNames).getByPosition(2),
        Item(2, 'Macaroons'),
      );
    });
  });
}
