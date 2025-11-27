import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatProvider extends ChangeNotifier {
  late IO.Socket socket;
  StreamController<String> messagesStreamController =
      StreamController<String>.broadcast();

  Stream<String> get messages => messagesStreamController.stream;

  connect() {
    socket = IO.io(
        'http://10.175.2.100:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    socket.onConnect((data) => print("Socket connected !!!!"));
    socket.on('New message', (data) => messagesStreamController.add(data));
    socket.onDisconnect(
      (data) => print("Socket disconnected"),
    );
    socket.onConnectError(
      (data) => print("Impossible to establish connection with socket"),
    );
  }
}
