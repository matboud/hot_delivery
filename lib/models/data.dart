import 'package:food_order/models/brand.dart';
import 'package:food_order/models/media.dart';
import 'package:food_order/models/meta_fields.dart';
import 'package:food_order/models/product_class.dart';
import 'package:food_order/models/variants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  int? id;
  String? title;
  String? slug;
  String? description;
  List<String>? customFields;
  ProductClass? productClass;
  String? productType;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  bool? featured;
  Brand? brand;
  List<Media>? media;
  List<String>? taxonomies;
  List<Variants>? variants;
  List<String>? groupables;
  @JsonKey(name: 'meta_fields')
  List<MetaFields>? metaFields;
  List<String>? metaMedia;

  Data(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.customFields,
        this.productClass,
        this.productType,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.featured,
        this.brand,
        this.media,
        this.taxonomies,
        this.variants,
        this.groupables,
        this.metaFields,
        this.metaMedia});

factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
Map<String, dynamic> toJson() => _$DataToJson(this);
}
