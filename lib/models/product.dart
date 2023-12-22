import 'package:food_order/models/media.dart';
import 'package:food_order/models/meta_fields.dart';
import 'package:food_order/models/product_class.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int? id;
  String? title;
  String? slug;
  String? description;
  List<dynamic>? customFields;
  ProductClass? productClass;
  String? productType;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  bool? featured;
  List<Media>? media;
  List<dynamic>? taxonomies;
  List<MetaFields>? metaFields;
  List<dynamic>? metaMedia;

  Product({
    this.id,
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
    this.media,
    this.taxonomies,
    this.metaFields,
    this.metaMedia,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
