import 'package:base_flutter/config/injection/dependencies.dart';
import 'package:base_flutter/config/widget/build_after_loaded.dart';
import 'package:base_flutter/service/synchronization_service.dart';
import 'package:base_flutter/utils/console.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BuildAfterLoaded<MyHomePage> {
  SynchronizationService? _synchronizationService;

  @override
  Future<void> loadBeforeBuild() async {
    _synchronizationService ??= await getIt.getAsync<SynchronizationService>();
  }
  
  @override
  Widget buildWidget(BuildContext context, AsyncSnapshot<void> _) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amber,
          title: const Text('Base Flutter'),
        ),
        body: Container(
          padding: const EdgeInsets.all(40),
          child: const Text("Funciona!"),
        ),
      );
  }
  
}
