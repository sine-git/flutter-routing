import 'dart:async';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageProvider extends ChangeNotifier {
  late IO.Socket socket;
  final _messageController = StreamController<String>.broadcast();

  Stream<String> get messages => _messageController.stream;

  connectWebSocket() {
    socket = IO.io(
        'http://10.175.2.116:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    socket.onConnect(
      (data) {
        print('Message Socket connected !!!!');
      },
    );
    socket.on('New message', (data) {
      final message = data;
      print('The new message is $message');
      _messageController.add(data);
    });
    socket.onDisconnect(
      (data) => print('Disonnected'),
    );
    socket.onConnectError(
      (data) => print("Impossible to establish connection with socket"),
    );
  }
}
