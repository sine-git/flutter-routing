import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:routing/blocs/skill/data/datasources/skill-data-source.dart';
import 'package:routing/blocs/skill/data/models/skill-model.dart';

class SkillDataSourceImpl implements SkillDataSource {
  final String baseUrl = "http://10.175.2.231:3000";

  @override
  Future<SkillModel> create(SkillModel skill) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(num id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<SkillModel>> findAll() async {
    try {
      final response = await http.get(Uri.parse("${baseUrl}/skill"));
      if (response.statusCode != 200)
        throw HttpException("Une erreur est survenue");
      final list = jsonDecode(response.body) as List<dynamic>;
      final List<SkillModel> skills =
          list.map((e) => SkillModel.fromMap(e)).toList();
      return skills;
    } catch (e, tr) {
      print(e);
      print(tr);
      throw HttpException("Une erreur est survenue");
    }
  }

  @override
  Future<SkillModel> update(SkillModel skill) async {
    // TODO: implement update
    throw UnimplementedError();
  }
}
