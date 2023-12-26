import 'package:json_annotation/json_annotation.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  List<ProductsModelData>? data;

  ProductsModel({this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}

@JsonSerializable()
class ProductsModelData {
  String? id;
  String? name;
  String? image;
  String? createdAt;
  bool isSelected;

  ProductsModelData(
      {this.id,
      this.name,
      this.image,
      this.createdAt,
      this.isSelected = false});

  factory ProductsModelData.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsModelDataToJson(this);
}
