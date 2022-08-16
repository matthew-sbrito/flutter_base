import 'package:base_flutter/entity/movement.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovementDao {
  @Query('SELECT * FROM Movement')
  Future<List<Movement>> findAll();

  @Query('SELECT * FROM Movement WHERE id = :id')
  Stream<Movement?> findById(int id);

  @insert
  Future<void> insertMovement(Movement movement);
}