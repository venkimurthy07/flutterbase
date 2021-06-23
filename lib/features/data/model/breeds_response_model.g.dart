// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breeds_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BreedsResponseModel _$BreedsResponseModelFromJson(Map<String, dynamic> json) {
  return BreedsResponseModel(
    id: json['id'] as int,
    name: json['name'] as String,
  )..image = json['image'] == null
      ? null
      : Image.fromJson(json['image'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BreedsResponseModelToJson(
        BreedsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
    };
