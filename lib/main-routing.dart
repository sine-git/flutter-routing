import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:routing/admin/admin-page.dart';
import 'package:routing/admin/counter-page.dart';
import 'package:routing/admin/role-page.dart';
import 'package:routing/admin/users-list-page.dart';
import 'package:routing/blocs/skill/data/datasources/skill-data-source-impl.dart';
import 'package:routing/blocs/skill/data/datasources/skill-data-source.dart';
import 'package:routing/blocs/skill/data/repositories/skill-repository-impl.dart';
import 'package:routing/blocs/skill/domain/repositories/skill-repository.dart';
import 'package:routing/blocs/skill/domain/usecase/create-skill.dart';
import 'package:routing/blocs/skill/domain/usecase/delete-skill.dart';
import 'package:routing/blocs/skill/domain/usecase/find-all-skills.dart';
import 'package:routing/blocs/skill/domain/usecase/update-skill.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-bloc.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-event.dart';
import 'package:routing/blocs/skill/presentation/pages/all-skills-page.dart';
import 'package:routing/user/account-page.dart';
import 'package:routing/user/home-page.dart';
import 'package:routing/user/login-page.dart';
import 'package:routing/user/user-page.dart';
import 'package:routing/video/stream-video-player.dart';

/// All Binds configurations

final mainRoutes = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          Get.lazyPut<SkillDataSource>(
            () => SkillDataSourceImpl(),
          );
          Get.lazyPut<SkillRepository>(
            () => SkillRepositoryImpl(dataSource: Get.find()),
          );
          Get.lazyPut<CreateSkill>(
            () => CreateSkill(skillRepository: Get.find()),
          );
          Get.lazyPut<UpdateSkill>(
            () => UpdateSkill(skillRepository: Get.find()),
          );
          Get.lazyPut<FindAllSkills>(
            () => FindAllSkills(skillRepository: Get.find()),
          );
          Get.lazyPut<DeleteSkill>(
            () => DeleteSkill(skillRepository: Get.find()),
          );
          final createSkill = Get.find<CreateSkill>();
          final updateSkill = Get.find<UpdateSkill>();
          final findAllSkills = Get.find<FindAllSkills>();
          final deleteSkill = Get.find<DeleteSkill>();
          return BlocProvider<SkillBloc>(
            create: (context) => SkillBloc(
                createSkill: createSkill,
                updateSkill: updateSkill,
                findAllSkills: findAllSkills,
                deleteSkill: deleteSkill)
              ..add(FindAllSkillsEvent()),
            child: AllSkillsPage(),
          );
        }),
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
