import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/get_cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entity/cart_entity.dart';

abstract class CartRepo {
  Future<Either<CommerceFailure, CartEntity>> addToCart(
    AddToCartRequest request,
  );

  Future<Either<CommerceFailure, GetCartResponse>> getCart();
}
