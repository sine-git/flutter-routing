import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;

  // Singleton
  static final SocketService _instance = SocketService._internal();

  factory SocketService() => _instance;

  SocketService._internal();

  connectWebSocket() {
    socket = IO.io(
        'http://10.175.2.116:3000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());
    socket.onConnect(
      (data) {
        print('Socket connected !!!!');
      },
    );
    socket.on('newMessage', (data) {
      final message = data;
      print('The new message is $message');
    });
    socket.onDisconnect(
      (data) => print('Disonnected'),
    );
  }
}
