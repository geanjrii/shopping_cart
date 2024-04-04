import 'package:equatable/equatable.dart';
import 'package:shopping_cart/feature_layer/catalog/models/item.dart';

class Catalog extends Equatable {
  const Catalog({required this.itemNames});

  final List<String> itemNames;

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) => getById(position);

  @override
  List<Object> get props => [itemNames];
}
