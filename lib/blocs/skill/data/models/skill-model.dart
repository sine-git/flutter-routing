import 'dart:convert';

import 'package:routing/blocs/skill/domain/entities/skill-entity.dart';

class SkillModel extends SkillEntity {
  SkillModel({required super.id, required super.designation});
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'designation': designation,
    };
  }

  factory SkillModel.fromMap(Map<String, dynamic> map) {
    return SkillModel(
      id: map['id'] as num,
      designation: map['designation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SkillModel.fromJson(String source) =>
      SkillModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
