import 'package:json_annotation/json_annotation.dart';

part 'conversions.g.dart';

@JsonSerializable()
class Conversions {
  String? thumb;
  String? mediumSquare;
  String? medium;
  String? large;

  Conversions({
    this.thumb,
    this.mediumSquare,
    this.medium,
    this.large,
  });

  factory Conversions.fromJson(Map<String, dynamic> json) =>
      _$ConversionsFromJson(json);
  Map<String, dynamic> toJson() => _$ConversionsToJson(this);
}
