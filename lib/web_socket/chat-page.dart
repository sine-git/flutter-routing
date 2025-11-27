import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat-provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messages = context.watch<ChatProvider>().messages;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
          stream: messages,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text(
                  "Une erreur est survenue lors de la récuperation des données!!");
            } else {
              return Text("The incoming message is ${snapshot.data}");
            }
          },
        ),
      ),
    );
  }
}
