import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing/providers/counter-provider.dart';
import 'package:routing/providers/theme-provider.dart';

class CounterPageWidget extends StatefulWidget {
  const CounterPageWidget({super.key});

  @override
  State<CounterPageWidget> createState() => CounterPageWidgetState();
}

class CounterPageWidgetState extends State<CounterPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text("This is role page"),
      ),
      body: Consumer<CounterProvider>(
        builder: (context, value, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoSwitch(
                value: context.watch<ThemeProvider>().isDarkMode(),
                onChanged: (value) {
                  context.read<ThemeProvider>().switchTheme();
                },
              ),
              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CounterProvider>().decrementCounter();
                    },
                    icon: Icon(Icons.remove),
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                  Text('${value.counter}',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inverseSurface,
                      )),
                  IconButton(
                      onPressed: () {
                        context.read<CounterProvider>().incrementCounter();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
