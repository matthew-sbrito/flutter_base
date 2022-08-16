import 'package:base_flutter/config/database/floor.dart';
import 'package:base_flutter/config/http/http_client.dart';
import 'package:base_flutter/service/movement_service.dart';
import 'package:base_flutter/service/synchronization_service.dart';

/// @author Matheus Brito
/// @profile https://github.com/matthew-sbrito
/// @since 15/08/22

Future<SynchronizationService> synchronizationServiceBuilder(
    HttpClient httpClient, MovementService movementService, AppDatabase appDatabase
) async {

  SynchronizationService instance = SynchronizationService(httpClient, movementService, appDatabase);

  movementService.setSynchronizationService(instance);

  return instance;
}

Future<MovementService> movementServiceBuilder(
  HttpClient httpClient
) async {
  return MovementService(httpClient);
}