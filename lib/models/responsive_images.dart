import 'package:json_annotation/json_annotation.dart';

part 'responsive_images.g.dart';

@JsonSerializable()
class ResponsiveImages {
  String? srcSet;
  String? src;
  int? width;
  int? height;

  ResponsiveImages({
    this.srcSet,
    this.src,
    this.width,
    this.height,
  });

  factory ResponsiveImages.fromJson(Map<String, dynamic> json) =>
      _$ResponsiveImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ResponsiveImagesToJson(this);
}
