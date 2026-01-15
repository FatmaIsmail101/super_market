import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entity/cart_entity.dart';

import 'cart_data.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse extends CartEntity {
  String? message;

  String? cartId;
  CartData? data;

  CartResponse({
    super.status,
    this.message,
    super.numOfCartItems,
    this.cartId,
    this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
