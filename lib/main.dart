import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/main-routing.dart';
import 'package:routing/providers/counter-provider.dart';
import 'package:routing/providers/theme-provider.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  //usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
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
