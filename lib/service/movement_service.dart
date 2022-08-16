import 'package:base_flutter/config/builder/service_builder.dart';
import 'package:base_flutter/config/http/http_client.dart';
import 'package:base_flutter/service/synchronization_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class MovementService {
  final HttpClient _httpClient;

  // CIRCULAR DEPENDENCY
  late SynchronizationService _synchronizationService;

  MovementService(this._httpClient);

  @factoryMethod
  static Future<MovementService> create(HttpClient httpClient) async => movementServiceBuilder(httpClient);

  // SET CIRCULAR DEPENDENCY
  void setSynchronizationService(SynchronizationService synchronizationService) {
    _synchronizationService = synchronizationService;
  }

}