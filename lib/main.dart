import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/main-routing.dart';
import 'package:routing/providers/chat-provider.dart';
import 'package:routing/providers/counter-provider.dart';
import 'package:routing/providers/theme-provider.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  //usePathUrlStrategy();
  //SocketService().connectWebSocket();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*ChangeNotifierProvider<MessageProvider>(
          create: (_) {
            final service = MessageProvider();
            service.connectWebSocket();
            return service;
          },
        ),*/
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider<ChatProvider>(create: (_) {
          print("Initializing the chat provider");
          final chatService = ChatProvider();
          chatService.connect();
          return chatService;
        }),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: mainRoutes,
          title: 'Flutter Demo',
          theme: Provider.of<ThemeProvider>(context).theme,
        );
      }),
    );
  }
}
