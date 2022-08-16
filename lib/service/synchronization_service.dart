import 'package:base_flutter/config/builder/service_builder.dart';
import 'package:base_flutter/config/database/floor.dart';
import 'package:base_flutter/config/http/http_client.dart';
import 'package:base_flutter/service/movement_service.dart';
import 'package:base_flutter/utils/console.dart' as console;
import 'package:injectable/injectable.dart';

@injectable
class SynchronizationService {

  final HttpClient httpClient;
  final MovementService movementService;
  final AppDatabase appDatabase;

  SynchronizationService(this.httpClient, this.movementService, this.appDatabase);

  @factoryMethod
  static Future<SynchronizationService> create(
      HttpClient httpClient, MovementService movementService, AppDatabase appDatabase
  ) async => synchronizationServiceBuilder(httpClient, movementService, appDatabase);

  Future<void> full() async {
    console.log(appDatabase, "database");
  }
}