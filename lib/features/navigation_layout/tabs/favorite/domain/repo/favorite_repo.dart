import 'package:dartz/dartz.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/favorite_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/get_favorite_response.dart';

abstract class FavoriteRepo {
  Future<Either<CommerceFailure, FavoriteResponse>> addFavorite(
    AddToCartRequest request,
  );

  Future<Either<CommerceFailure, GetFavoriteResponse>> getFavorite();
}
