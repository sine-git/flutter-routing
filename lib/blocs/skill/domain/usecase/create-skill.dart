// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';
import 'package:routing/blocs/skill/domain/repositories/skill-repository.dart';

class CreateSkill {
  final SkillRepository skillRepository;
  CreateSkill({required this.skillRepository});
  call(SkillEntity skill) {
    this.skillRepository.create(skill);
  }
}
