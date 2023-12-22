import 'package:food_order/models/media.dart';
import 'package:food_order/models/price.dart';
import 'package:food_order/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'variants.g.dart';

@JsonSerializable()
class Variants {
  int? id;
  bool? isPublished;
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? type;
  int? grams;
  String? title;
  String? pricingType;
  Price? price;
  String? priceUnitExcVat;
  int? vatId;
  Product? product;
  List<dynamic>? subscriptionPlans;
  List<dynamic>? variantTypeOptions;
  List<Media>? media;

  Variants({
    this.id,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.type,
    this.grams,
    this.title,
    this.pricingType,
    this.price,
    this.priceUnitExcVat,
    this.vatId,
    this.product,
    this.subscriptionPlans,
    this.variantTypeOptions,
    this.media,
  });

  factory Variants.fromJson(Map<String, dynamic> json) =>
      _$VariantsFromJson(json);
  Map<String, dynamic> toJson() => _$VariantsToJson(this);
}
