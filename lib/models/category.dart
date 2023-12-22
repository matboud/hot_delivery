import 'package:food_order/models/taxonomy.dart';
import 'package:json_annotation/json_annotation.dart';


part 'category.g.dart';

@JsonSerializable()
class Category {
  int? id;
  int? taxonomyId;
  String? parentId;
  int? iLft;
  int? iRgt;
  String? priority;
  String? name;
  String? slug;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? createdAt;
  String? updatedAt;
  Taxonomy? taxonomy;
  List<dynamic>? children;

  Category(
      {this.id,
        this.taxonomyId,
        this.parentId,
        this.iLft,
        this.iRgt,
        this.priority,
        this.name,
        this.slug,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.createdAt,
        this.updatedAt,
        this.taxonomy,
        this.children});


  /// Connect the generated [_$CategoryFromJson] function to the `fromJson`
  /// factory.
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  /// Connect the generated [_$CategoryToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryToJson(this);


}

