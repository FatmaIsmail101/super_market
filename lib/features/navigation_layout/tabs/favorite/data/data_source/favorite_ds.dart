import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/favorite_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/get_favorite_response.dart';

import '../../../../../../core/constants/di.dart';

abstract class FavoriteDs {
  Future<FavoriteResponse> addFavorite(String token, AddToCartRequest request);

  Future<GetFavoriteResponse> getFavorite(String token);
}

@Injectable(as: FavoriteDs)
class FavoriteDsImpl implements FavoriteDs {
  @override
  Future<FavoriteResponse> addFavorite(String token, AddToCartRequest request) {
    return getIt<EcommerceClient>().addFavorite(token, request);
  }

  @override
  Future<GetFavoriteResponse> getFavorite(String token) {
    return getIt<EcommerceClient>().getFavorite(token);
  }
}
