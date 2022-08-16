import 'package:flutter/foundation.dart';

void show(Object? source, String type, [String? debug = "debug"]) {
  if (kDebugMode) {
    print("==================> $type START ($debug) <==================");
    print(source ?? "is null");
    print("==================> $type END ($debug}) <==================");
  }
}

void log(Object? source, [String? debug]) {
  show(source, "LOG", debug);
}

void error(Object? source, [String? debug]) {
  show(source, "ERROR", debug);
}