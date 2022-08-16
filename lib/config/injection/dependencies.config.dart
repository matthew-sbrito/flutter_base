// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../module/app.dart' as _i7;
import '../../service/movement_service.dart' as _i5;
import '../../service/synchronization_service.dart' as _i6;
import '../database/floor.dart' as _i3;
import '../http/http_client.dart' as _i4;

const String _dev = 'dev';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singletonAsync<_i3.AppDatabase>(() => appModule.database());
  gh.factory<String>(() => appModule.developmentUrl,
      instanceName: 'BaseUrl', registerFor: {_dev});
  gh.factory<String>(() => appModule.productionUrl,
      instanceName: 'BaseUrl', registerFor: {_prod});
  gh.singleton<_i4.HttpClient>(
      appModule.httpClient(get<String>(instanceName: 'BaseUrl')));
  gh.factoryAsync<_i5.MovementService>(
      () => _i5.MovementService.create(get<_i4.HttpClient>()));
  gh.factoryAsync<_i6.SynchronizationService>(() async =>
      _i6.SynchronizationService.create(
          get<_i4.HttpClient>(),
          await get.getAsync<_i5.MovementService>(),
          await get.getAsync<_i3.AppDatabase>()));
  return get;
}

class _$AppModule extends _i7.AppModule {}
