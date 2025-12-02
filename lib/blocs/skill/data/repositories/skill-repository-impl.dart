import 'package:routing/blocs/skill/data/datasources/skill-data-source.dart';
import 'package:routing/blocs/skill/data/models/skill-model.dart';
import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';
import 'package:routing/blocs/skill/domain/repositories/skill-repository.dart';

class SkillRepositoryImpl implements SkillRepository {
  final SkillDataSource dataSource;

  SkillRepositoryImpl({required this.dataSource});
  @override
  Future<SkillEntity> create(SkillEntity skill) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(num id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<SkillEntity>> findAll() async {
    // TODO: implement findAll
    return dataSource.findAll();
  }

  @override
  Future<SkillEntity> update(SkillEntity skill) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
