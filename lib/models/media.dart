import 'package:food_order/models/conversions.dart';
import 'package:food_order/models/responsive_images.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable()
class Media {
  String? uuid;
  String? name;
  String? fileName;
  String? url;
  int? order;
  List<String>? customProperties;
  String? type;
  String? extension;
  int? size;
  String? mimeType;
  ResponsiveImages? responsiveImages;
  Conversions? conversions;

  Media({
    this.uuid,
    this.name,
    this.fileName,
    this.url,
    this.order,
    this.customProperties,
    this.type,
    this.extension,
    this.size,
    this.mimeType,
    this.responsiveImages,
    this.conversions,
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
