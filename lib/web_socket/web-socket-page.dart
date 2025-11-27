import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/providers/message-provider.dart';

class WebSocketPage extends StatefulWidget {
  const WebSocketPage({super.key});

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messages = context.read<MessageProvider>().messages;
    return Scaffold(
      appBar: AppBar(
        title: Text("All messages"),
      ),
      body: StreamBuilder(
        stream: messages,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Une erreur est survenue lors de l'appel"),
            );
          } else if (snapshot.hasData) {
            var message = snapshot.data;
            return Center(child: Text('$message'));
          } else
            return Center(
              child: Text("En attente des données"),
            );
        },
      ),
    );
  }
}
