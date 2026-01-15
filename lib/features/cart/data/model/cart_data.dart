import 'package:json_annotation/json_annotation.dart';

import 'cart_product.dart';

part 'cart_data.g.dart';

@JsonSerializable()
class CartData {
  @JsonKey(name: "_id")
  String? id;

  String? cartOwner;
  List<CartProduct>? products;
  String? createdAt;
  String? updatedAt;

  @JsonKey(name: "__v")
  int? v;

  int? totalCartPrice;

  CartData({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}
