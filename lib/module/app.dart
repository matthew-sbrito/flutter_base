import 'package:base_flutter/config/database/floor.dart';
import 'package:base_flutter/config/http/http_client.dart';
import 'package:base_flutter/config/injection/dependencies.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @development
  @Named("BaseUrl")
  String get developmentUrl => "dev:url";

  @production
  @Named("BaseUrl")
  String get productionUrl => "prod:url";

  @singleton
  HttpClient httpClient(@Named('BaseUrl') String url) => HttpClient(url);

  @singleton
  Future<AppDatabase> database() async {
    return await $FloorAppDatabase.databaseBuilder('flutter_base.db').build();
  }
}