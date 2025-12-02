import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';

abstract class SkillRepository {
  Future<List<SkillEntity>> findAll();
  Future<SkillEntity> create(SkillEntity skill);
  Future<SkillEntity> update(SkillEntity skill);
  Future<void> delete(num id);
}
