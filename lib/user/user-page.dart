import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPageWidget extends StatefulWidget {
  const UserPageWidget({super.key});

  @override
  State<UserPageWidget> createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is user page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () => {context.go("/user/login")},
                child: Text("Login list page")),
            TextButton(
                onPressed: () => {context.go("/user/home")},
                child: Text("Home list page")),
            TextButton(
                onPressed: () => {context.go("/user/account")},
                child: Text("Account list page")),
          ],
        ),
      ),
    );
  }
}
