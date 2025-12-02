// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:routing/blocs/skill/domain/repositories/skill-repository.dart';

class DeleteSkill {
  final SkillRepository skillRepository;
  DeleteSkill({
    required this.skillRepository,
  });

  call(num id) {
    return skillRepository.delete(id);
  }
}
