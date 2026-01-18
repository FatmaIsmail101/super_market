import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/data_source/favorite_ds.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/favorite_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/get_favorite_response.dart';

import '../../../../../../core/cache_helper/cache_helper.dart';
import '../../domain/repo/favorite_repo.dart';

@Injectable(as: FavoriteRepo)
class FavoriteRepoImpl implements FavoriteRepo {
  final FavoriteDs _favoriteDs;

  FavoriteRepoImpl(this._favoriteDs);

  @override
  Future<Either<CommerceFailure, FavoriteResponse>> addFavorite(
    AddToCartRequest request,
  ) async {
    try {
      final token = CacheHelper.getString("token");
      final result = await _favoriteDs.addFavorite(token ?? "", request);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CommerceFailure, GetFavoriteResponse>> getFavorite() async {
    try {
      final token = CacheHelper.getString("token");
      final result = await _favoriteDs.getFavorite(token ?? "");
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
