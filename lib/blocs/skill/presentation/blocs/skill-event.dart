import 'package:routing/blocs/skill/data/models/skill-model.dart';

abstract class SkillEvent {}

class CreateSkillEvent extends SkillEvent {
  final SkillModel skillModel;

  CreateSkillEvent({required this.skillModel});
}

class UpdateSkillEvent extends SkillEvent {
  final SkillModel skillModel;

  UpdateSkillEvent({required this.skillModel});
}

class DeleteSkillEvent extends SkillEvent {}

class FindAllSkillsEvent extends SkillEvent {}
