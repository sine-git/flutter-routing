import 'dart:convert';
import 'dart:io';

import 'package:routing/blocs/skill/data/models/skill-model.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/status.dart';

abstract class SkillDataSource {
  Future<SkillModel> create(SkillModel skill);
  Future<void> delete(num id);
  Future<List<SkillModel>> findAll();
  Future<SkillModel> update(SkillModel skill);
}
