import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AppNavigationTabBar extends StatefulWidget {
  const AppNavigationTabBar({super.key});

  @override
  State<AppNavigationTabBar> createState() => _AppBState();
}

class _AppBState extends State<AppNavigationTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Navigation Tab Bar'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'Tab 1',
            ),
            Tab(
              text: 'Tab 2',
            ),
            Tab(
              text: 'Tab 3',
            )
          ]),
        ),
        body: TabBarView(children: [
          Center(
            child: Text("Tab 1"),
          ),
          Center(
            child: Text("Tab 2"),
          ),
          Center(
            child: Text("Tab 3"),
          ),
        ]),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(child: Icon(Icons.favorite), shape: CircleBorder()),
            SpeedDialChild(child: Icon(Icons.settings), shape: CircleBorder()),
          ],
        ),
      ),
    );
  }
}
