// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';

abstract class SkillState {}

class SkillInitialState extends SkillState {}

class SkillLoadingState extends SkillState {}

class SkillLoadedState extends SkillState {
  List<SkillEntity> skills;
  SkillLoadedState({
    required this.skills,
  });
}

class SkillErrorOperation extends SkillState {
  String message;
  SkillErrorOperation({
    required this.message,
  });
}

class SkillSuccessOperation extends SkillState {
  String message;
  SkillSuccessOperation({
    required this.message,
  });
}
