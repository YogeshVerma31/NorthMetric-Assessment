// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      data: (json as List<dynamic>?)
          ?.map((e) => ProductsModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductsModelData _$ProductsModelDataFromJson(Map<String, dynamic> json) =>
    ProductsModelData(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ProductsModelDataToJson(ProductsModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'createdAt': instance.createdAt,
    };
