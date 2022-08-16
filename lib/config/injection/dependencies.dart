import 'package:base_flutter/config/injection/dependencies.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

/// @author Matheus Brito
/// @profile https://github.com/matthew-sbrito
/// @since 15/08/22

final getIt = GetIt.instance;

const development = Environment('dev');
const production = Environment('prod');

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
void configureDependencies(String environment) => $initGetIt(getIt, environment: environment);