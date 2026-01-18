import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/networking/ecommerce_client.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/get_cart_response.dart';

abstract class CartDataSource {
  Future<CartResponse> addToCart(String token, AddToCartRequest request);

  Future<GetCartResponse> getCart(String token);
}

@Injectable(as: CartDataSource)
class CartDSImpl implements CartDataSource {
  @override
  Future<CartResponse> addToCart(String token, AddToCartRequest request) {
    return getIt<EcommerceClient>().addToCart(request, token);
  }

  @override
  Future<GetCartResponse> getCart(String token) {
    return getIt<EcommerceClient>().getCart(token);
  }
}
