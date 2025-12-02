import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-bloc.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-event.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-state.dart';

class AllSkillsPage extends StatelessWidget {
  const AllSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SkillBloc, SkillState>(
      builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("All Skills"),
          ),
          body: Builder(
            builder: (context) {
              if (state is SkillLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SkillLoadedState) {
                return ListView.builder(
                  itemCount: state.skills.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text("${state.skills[index].id}"),
                    subtitle: Text("${state.skills[index].designation}"),
                  ),
                );
              } else {
                return Center(
                  child: Text("Impossible to load datas"),
                );
              }
            },
          )),
    );
  }
}
