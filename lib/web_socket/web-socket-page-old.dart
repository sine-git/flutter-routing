import 'package:flutter/material.dart';
import 'package:routing/services/socket-service.dart';

class WebSocketPage extends StatefulWidget {
  const WebSocketPage({super.key});

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  final SocketService socketService = SocketService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    socketService.socket.on('New message', (data) {
      //final message = data;
      print('The new message is $data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Steam messages"))

        /* StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Une erreur est survenue lors de l'appel"),
            );
          } else {
            var messages = snapshot.data as List<String>;
            return Container(
              child: ListView.builder(
                itemBuilder: (context, index) => Text("${messages[index]}"),
              ),
            );
          }
        },
      ), */
        );
  }
}
