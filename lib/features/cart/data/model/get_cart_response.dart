import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entity/cart_entity.dart';

import 'cart_data.dart';

part 'get_cart_response.g.dart';

@JsonSerializable()
class GetCartResponse extends CartEntity {
  @override
  final String? status;
  @override
  final int? numOfCartItems;
  final String? cartId;
  final CartData? data;

  GetCartResponse({this.status, this.numOfCartItems, this.cartId, this.data});

  factory GetCartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartResponseToJson(this);
}
