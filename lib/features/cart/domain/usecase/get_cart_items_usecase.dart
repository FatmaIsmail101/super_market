import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/get_cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repo/cart_repo.dart';

import '../../../../core/error_handling/error_handling.dart';

@injectable
class GetCartItemsUsecase {
  final CartRepo _cartRepo;

  GetCartItemsUsecase(this._cartRepo);

  Future<Either<CommerceFailure, GetCartResponse>> getCart() {
    return _cartRepo.getCart();
  }
}
