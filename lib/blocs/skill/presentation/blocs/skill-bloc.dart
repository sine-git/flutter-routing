// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routing/blocs/skill/data/models/skill-model.dart';

import 'package:routing/blocs/skill/domain/usecase/create-skill.dart';
import 'package:routing/blocs/skill/domain/usecase/delete-skill.dart';
import 'package:routing/blocs/skill/domain/usecase/find-all-skills.dart';
import 'package:routing/blocs/skill/domain/usecase/update-skill.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-event.dart';
import 'package:routing/blocs/skill/presentation/blocs/skill-state.dart';

class SkillBloc extends Bloc<SkillEvent, SkillState> {
  CreateSkill createSkill;
  UpdateSkill updateSkill;
  FindAllSkills findAllSkills;
  DeleteSkill deleteSkill;
  SkillBloc(
      {required this.createSkill,
      required this.updateSkill,
      required this.findAllSkills,
      required this.deleteSkill})
      : super(SkillInitialState()) {
    on<FindAllSkillsEvent>(_onFindAllSkills);
  }

  FutureOr<void> _onFindAllSkills(
      FindAllSkillsEvent event, Emitter<SkillState> emit) async {
    try {
      emit(SkillLoadingState());
      List<SkillModel> skills = await findAllSkills();
      emit(SkillLoadedState(skills: skills));
    } catch (e, tr) {
      emit(SkillErrorOperation(message: "Une erreur est survenue"));
    }
  }
}
