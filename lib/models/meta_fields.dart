import 'package:json_annotation/json_annotation.dart';

part 'meta_fields.g.dart';

@JsonSerializable()
class MetaFields {
  String? key;
  dynamic value;

  MetaFields({
    this.key,
    this.value,
  });

  factory MetaFields.fromJson(Map<String, dynamic> json) =>
      _$MetaFieldsFromJson(json);
  Map<String, dynamic> toJson() => _$MetaFieldsToJson(this);
}
