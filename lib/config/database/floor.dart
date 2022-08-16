import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:base_flutter/repository/movement_dao.dart';
import 'package:base_flutter/entity/movement.dart';

part 'floor.g.dart';

@Database(version: 1, entities: [
  Movement
])
abstract class AppDatabase extends FloorDatabase {
  MovementDao get movementDao;
}