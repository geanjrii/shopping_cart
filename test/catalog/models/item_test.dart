import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/feature_layer/catalog/models/item.dart';

void main() {
  group('Item', () {
    test('supports value comparison', () async {
      expect(Item(1, 'item #1'), Item(1, 'item #1'));
    });
  });
}
