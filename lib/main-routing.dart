import 'package:go_router/go_router.dart';
import 'package:routing/admin/admin-page.dart';
import 'package:routing/admin/counter-page.dart';
import 'package:routing/admin/role-page.dart';
import 'package:routing/admin/users-list-page.dart';
import 'package:routing/user/account-page.dart';
import 'package:routing/user/home-page.dart';
import 'package:routing/user/login-page.dart';
import 'package:routing/user/user-page.dart';

import 'web_socket/chat-page.dart';

final mainRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ChatPage(),
    ),
    GoRoute(
        path: '/user',
        builder: (context, state) => const UserPageWidget(),
        routes: [
          GoRoute(
            path: 'home',
            builder: (context, state) => const HomePageWidget(),
          ),
          GoRoute(
            path: 'account',
            builder: (context, state) => const AccountPageWidget(),
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginPageWidget(),
          ),
        ]),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminPageWidget(),
      routes: [
        GoRoute(
          path: 'users',
          builder: (context, state) => const UsersListPageWidget(),
        ),
        GoRoute(
            path: 'roles/:id',
            builder: (context, state) {
              String? id = state.pathParameters['id'];
              print("The role id is ${id}");
              return RolePageWidget();
            }),
        GoRoute(
          path: 'counter',
          builder: (context, state) => CounterPageWidget(),
        )
      ],
    ),
  ],
  //errorBuilder: (context, state) => LoginPageWidget(),
);
