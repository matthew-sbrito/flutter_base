import 'dart:convert';

import 'package:base_flutter/config/injection/dependencies.dart';
import 'package:base_flutter/config/widget/build_after_loaded.dart';
import 'package:base_flutter/service/synchronization_service.dart';
import 'package:base_flutter/utils/console.dart';
import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

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

  StompClient? _stompClient;
  Map? currentData;

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
        child: Column(
          children: [
            TextButton(
                onPressed: _webSocketConnect, child: const Text("Connect")),
            TextButton(onPressed: _sendStompMessage, child: const Text("Send")),
            getContent(context)
          ],
        ),
      ),
    );
  }

  Widget getContent(BuildContext context) {
    return _stompClient == null && currentData == null
        ? Container()
        : buildItem(context);
  }

  Widget buildItem(BuildContext context) {
    final currentIndex = currentData!["index"] as String;

    double value;

    try {
      value = double.parse(currentIndex) / 10;
    } catch(e) {
      value = 1;
    }

    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(currentData!["test"] as String),
          Text(currentIndex),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LinearProgressIndicator(
                backgroundColor: Colors.cyanAccent,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                value: value,
              ),
              Text('${(value * 100).round()}%'),
            ],
          )
        ],
      ),
    );
  }

  _webSocketConnect() {
    print("PREPARE TO CONNECT!");

    _stompClient = StompClient(
      config: StompConfig.SockJS(
          url: "http://192.168.1.117:8080/est-websocket?user-id=1234",
          onConnect: _onConnectWebSocket,
          onStompError: (error) {
            print("Stom error!");
            print(error);
          },
          onWebSocketError: (error) {
            print("Error to connect!");
            print(error);
          }),
    );

    _stompClient?.activate();
  }

  _onConnectWebSocket(StompFrame frame) {
    print("Connected in websocket");

    _stompClient?.subscribe(
        destination: "/user/estoque/importMobile",
        callback: (StompFrame frame) {
          setState(() {
            currentData = jsonDecode(frame.body!);
          });
        });
  }

  _sendStompMessage() {
    _stompClient?.send(destination: "/ws/startImport");
  }
}
