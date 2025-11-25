import 'package:flutter/material.dart';

class AccountPageWidget extends StatefulWidget {
  const AccountPageWidget({super.key});

  @override
  State<AccountPageWidget> createState() => _AccountPageWidgetState();
}

class _AccountPageWidgetState extends State<AccountPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is account page"),
      ),
    );
  }
}
