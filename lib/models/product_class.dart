
import 'package:json_annotation/json_annotation.dart';

part 'product_class.g.dart';

@JsonSerializable()
class ProductClass {
  int? id;
  String? slug;
  String? name;

  ProductClass({
    this.id,
    this.slug,
    this.name,
  });

  factory ProductClass.fromJson(Map<String, dynamic> json) =>
      _$ProductClassFromJson(json);
  Map<String, dynamic> toJson() => _$ProductClassToJson(this);
}
