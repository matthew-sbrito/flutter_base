import 'package:floor/floor.dart';

@entity
class Movement {
  @primaryKey
  final int id;
  final int quantity;

  Movement(this.id, this.quantity);
}