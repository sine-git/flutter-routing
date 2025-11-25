import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:routing/admin/model/user.dart';

class UsersListPageWidget extends StatefulWidget {
  const UsersListPageWidget({super.key});

  @override
  State<UsersListPageWidget> createState() => UsersListPageWidgetState();
}

class UsersListPageWidgetState extends State<UsersListPageWidget> {
  String apiUrl = 'https://jsonplaceholder.typicode.com/users';
  Future<List<User>> getUsers() async {
    try {
      Uri uri = Uri.parse(apiUrl);
      final resp = await http.get(uri);
      final respBody = jsonDecode(resp.body) as List;

      final List<User> users = respBody
          .map(
            (e) => User.fromJson(e),
          )
          .toList();
      print("..... The users list is ${users}");
      return users;
    } catch (exception) {
      print("Error is $exception");
      throw Exception("Une erreur est survenue lors de l'appel");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "This is user list page",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //spacing: 2,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                //height: 50,
                child: TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
              ),
            ),
            Expanded(
                flex: 9,
                child: Container(
                  //color: Colors.pink,
                  child: FutureBuilder(
                    future: getUsers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting)
                        return Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator());
                      else if (snapshot.hasError) {
                        return Text("Une erreur est survenue");
                      } else {
                        List<User> users = snapshot.data!;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          //shrinkWrap: true,
                          //shrinkWrap: true,
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(users[index].name),
                              subtitle: Text(users[index].username),
                            );
                          },
                        );
                        /* return Column(
                    children: users
                        .map(
                          (user) => ListTile(
                            title: Text(user.name),
                            subtitle: Text(user.username),
                          ),
                        )
                        .toList(),
                  ); */
                      }
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
