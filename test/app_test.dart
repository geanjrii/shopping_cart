import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/app/app.dart';
import 'package:shopping_cart/domain_layer/shopping_repository.dart';
import 'package:shopping_cart/feature_layer/cart/view/cart_page.dart';
import 'package:shopping_cart/feature_layer/catalog/view/catalog_page.dart';

class MockShoppingRepository extends Mock implements ShoppingRepository {}

void main() {
  group('App', () {
    late ShoppingRepository shoppingRepository;

    setUp(() {
      shoppingRepository = MockShoppingRepository();
      when(shoppingRepository.loadCatalog).thenAnswer(
        (_) async => <String>['Orange Juice', 'Milk'],
      );
    });

    testWidgets('renders CatalogPage', (tester) async {
      await tester.pumpWidget(App(shoppingRepository: shoppingRepository));
      expect(find.byType(CatalogPage), findsOneWidget);
    });

    testWidgets('renders CatalogPage (initial route)', (tester) async {
      await tester.pumpWidget(App(shoppingRepository: shoppingRepository));
      expect(find.byType(CatalogPage), findsOneWidget);
    });

    testWidgets(
        'can navigate back and forth '
        'between CartPage and CatalogPage', (tester) async {
      await tester.pumpWidget(App(shoppingRepository: shoppingRepository));

      await tester.tap(find.byIcon(Icons.shopping_cart));
      await tester.pumpAndSettle();

      expect(find.byType(CartPage), findsOneWidget);
      expect(find.byType(CatalogPage), findsNothing);

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(CartPage), findsNothing);
      expect(find.byType(CatalogPage), findsOneWidget);
    });
  });
}
