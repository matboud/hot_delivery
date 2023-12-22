import 'package:json_annotation/json_annotation.dart';

part 'taxonomy.g.dart';

@JsonSerializable()
class Taxonomy {
  int? id;
  String? name;
  String? slug;
  String? createdAt;
  String? updatedAt;

  Taxonomy({this.id, this.name, this.slug, this.createdAt, this.updatedAt});


  /// Connect the generated [_$TaxonomyFromJson] function to the `fromJson`
  /// factory.
  factory Taxonomy.fromJson(Map<String, dynamic> json) => _$TaxonomyFromJson(json);

  /// Connect the generated [_$TaxonomyToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TaxonomyToJson(this);

}