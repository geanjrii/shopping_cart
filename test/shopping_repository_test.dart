import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/domain_layer/shopping_repository.dart';
import 'package:shopping_cart/feature_layer/catalog/models/item.dart';

void main() {
  const mockItems = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenbug',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];
  
  final mockItem = Item(1, 'item #1');

  group('ShoppingRepository', () {
    late ShoppingRepository shoppingRepository;

    setUp(() {
      shoppingRepository = ShoppingRepository();
    });

    group('loadCatalog', () {
      test('returns list of item names', () {
        expect(
          shoppingRepository.loadCatalog(),
          completion(equals(mockItems)),
        );
      });
    });

    group('loadCartItems', () {
      test('return empty list after loading cart items', () {
        expect(
          shoppingRepository.loadCartItems(),
          completion(equals(<Item>[])),
        );
      });
    });

    group('addItemToCart', () {
      test('returns newly added item after adding item to cart', () {
        shoppingRepository.addItemToCart(mockItem);
        expect(
          shoppingRepository.loadCartItems(),
          completion(equals([mockItem])),
        );
      });
    });

    group('removeItemFromCart', () {
      test('removes item from cart', () {
        shoppingRepository
          ..addItemToCart(mockItem)
          ..removeItemFromCart(mockItem);
        expect(
          shoppingRepository.loadCartItems(),
          completion(equals(<Item>[])),
        );
      });
    });
  });
}
