import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/admin/model/user.dart';
import 'package:http/http.dart' as http;

class AdminPageWidget extends StatefulWidget {
  const AdminPageWidget({super.key});

  @override
  State<AdminPageWidget> createState() => _AdminPageWidgetState();
}

class _AdminPageWidgetState extends State<AdminPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is admin page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () => {context.go("/admin/users")},
                child: Text("User list page")),
            TextButton(
                onPressed: () => {context.go("/admin/roles")},
                child: Text("Role list page")),
            TextButton(
                onPressed: () => {context.go("/admin/counter")},
                child: Text("Counter page", style: TextStyle(),))
          ],
        ),
      ),
    );
  }
}
