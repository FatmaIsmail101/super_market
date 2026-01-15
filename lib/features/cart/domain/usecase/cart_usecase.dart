import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entity/cart_entity.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repo/cart_repo.dart';

@injectable
class CartUsecase {
  CartRepo _cartRepo;

  CartUsecase(this._cartRepo);

  Future<Either<CommerceFailure, CartEntity>> addToCart(
    AddToCartRequest request,
  ) {
    return _cartRepo.addToCart(request);
  }
}
