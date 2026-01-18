import 'package:json_annotation/json_annotation.dart';

part 'cart_product.g.dart';

@JsonSerializable()
class CartProduct {
  int? count;

  @JsonKey(name: "_id")
  String? id;

  String? product;
  int? price;

  CartProduct({this.count, this.id, this.product, this.price});

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}
