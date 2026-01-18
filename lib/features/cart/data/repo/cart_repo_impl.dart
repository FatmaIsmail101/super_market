import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/cache_helper/cache_helper.dart';
import 'package:route_e_commerce_v2/features/cart/data/datasource/cart_data_source.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/get_cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/error_handling/error_handling.dart';
import '../../domain/entity/cart_entity.dart';

@Injectable(as: CartRepo)
class CartRepoImpl implements CartRepo {
  CartDataSource cartDataSource;

  CartRepoImpl(this.cartDataSource);

  @override
  Future<Either<CommerceFailure, CartEntity>> addToCart(
    AddToCartRequest request,
  ) async {
    try {
      final token = CacheHelper.getString("token");
      final result = await cartDataSource.addToCart(token ?? "", request);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CommerceFailure, GetCartResponse>> getCart() async {
    try {
      final token = CacheHelper.getString("token");
      final result = await cartDataSource.getCart(token ?? "");
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
