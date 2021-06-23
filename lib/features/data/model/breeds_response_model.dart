import 'package:json_annotation/json_annotation.dart';

part 'breeds_response_model.g.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
@JsonSerializable()
class BreedsResponseModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "image")
  Image image;

  BreedsResponseModel({this.id, this.name});

  factory BreedsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BreedsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BreedsResponseModelToJson(this);
}

@JsonSerializable()
class Image {
  @JsonKey(name: "url")
  String url;

  Image({this.url});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
