// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shopping_cart/domain_layer/shopping_repository.dart';
import 'package:shopping_cart/feature_layer/catalog/bloc/catalog_bloc.dart';
import 'package:shopping_cart/feature_layer/catalog/models/catalog.dart';

class MockShoppingRepository extends Mock implements ShoppingRepository {}

void main() {
  const mockItemNames = ['Orange Juice', 'Milk', 'Macaroons', 'Cookies'];

  group('CatalogBloc', () {
    late ShoppingRepository shoppingRepository;

    setUp(() {
      shoppingRepository = MockShoppingRepository();
    });

    CatalogBloc buildBloc() => CatalogBloc(shoppingRepository: shoppingRepository);

    test('initial state is CatalogLoading', () {
      expect(
        buildBloc().state,
        CatalogLoading(),
      );
    });

    blocTest<CatalogBloc, CatalogState>(
      'emits [CatalogLoading, CatalogLoaded] '
      'when catalog is loaded successfully',
      setUp: () {
        when(shoppingRepository.loadCatalog).thenAnswer(
          (_) async => mockItemNames,
        );
      },
      build: buildBloc,
      act: (bloc) => bloc.add(CatalogStarted()),
      expect: () => <CatalogState>[
        CatalogLoading(),
        CatalogLoaded(Catalog(itemNames: mockItemNames)),
      ],
      verify: (_) => verify(shoppingRepository.loadCatalog).called(1),
    );

    blocTest<CatalogBloc, CatalogState>(
      'emits [CatalogLoading, CatalogError] '
      'when loading the catalog throws an exception',
      setUp: () {
        when(shoppingRepository.loadCatalog).thenThrow(Exception('Error'));
      },
      build: buildBloc,
      act: (bloc) => bloc.add(CatalogStarted()),
      expect: () => <CatalogState>[
        CatalogLoading(),
        CatalogError(),
      ],
      verify: (_) => verify(shoppingRepository.loadCatalog).called(1),
    );
  });
}
