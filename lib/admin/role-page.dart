import 'package:flutter/material.dart';

class RolePageWidget extends StatefulWidget {
  const RolePageWidget({super.key});

  @override
  State<RolePageWidget> createState() => RolePageWidgetState();
}

class RolePageWidgetState extends State<RolePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is role page"),
      ),
    );
  }
}
