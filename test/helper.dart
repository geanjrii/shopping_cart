import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/feature_layer/cart/bloc/cart_bloc.dart';
import 'package:shopping_cart/feature_layer/catalog/bloc/catalog_bloc.dart';

class MockCartBloc extends MockBloc<CartEvent, CartState> implements CartBloc {}

class MockCatalogBloc extends MockBloc<CatalogEvent, CatalogState>
    implements CatalogBloc {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp({
    required Widget child,
    CartBloc? cartBloc,
    CatalogBloc? catalogBloc,
  }) {
    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            if (cartBloc != null)
              BlocProvider.value(value: cartBloc)
            else
              BlocProvider(create: (_) => MockCartBloc()),
            if (catalogBloc != null)
              BlocProvider.value(value: catalogBloc)
            else
              BlocProvider(create: (_) => MockCatalogBloc()),
          ],
          child: child,
        ),
      ),
    );
  }
}
