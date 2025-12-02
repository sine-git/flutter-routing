// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';
import 'package:routing/blocs/skill/domain/repositories/skill-repository.dart';

class FindAllSkills {
  final SkillRepository skillRepository;
  FindAllSkills({
    required this.skillRepository,
  });

  call() {
    return skillRepository.findAll();
  }
}
