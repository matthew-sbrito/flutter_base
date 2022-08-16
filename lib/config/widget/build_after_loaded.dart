import 'package:base_flutter/utils/console.dart';
import 'package:flutter/material.dart';

/// @author Matheus Brito
/// @profile https://github.com/matthew-sbrito
/// @since 15/08/22
abstract class BuildAfterLoaded<T extends StatefulWidget> extends State<T> {
  bool _isLoaded = false;
  AsyncSnapshot<void>? _asyncSnapshot;

  Future<void> loadBeforeBuild();

  Widget buildWidget(BuildContext context, AsyncSnapshot<void> asyncSnapshot);

  @override
  Widget build(BuildContext context) {
    if (_isLoaded) {
      return buildWidget(context, _asyncSnapshot!);
    }

    return FutureBuilder<void>(
        future: loadBeforeBuild(),
        builder: (context, asyncSnapshot) {
          _isLoaded = true;
          _asyncSnapshot = asyncSnapshot;

          return buildWidget(context, asyncSnapshot);
        }
    );
  }
}
