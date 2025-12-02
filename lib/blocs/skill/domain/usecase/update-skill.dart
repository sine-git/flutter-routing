import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';
import 'package:routing/blocs/skill/domain/repositories/skill-repository.dart';

class UpdateSkill {
  final SkillRepository skillRepository;

  UpdateSkill({required this.skillRepository});
  call(SkillEntity skill) {
    return this.skillRepository.create(skill);
  }
}
