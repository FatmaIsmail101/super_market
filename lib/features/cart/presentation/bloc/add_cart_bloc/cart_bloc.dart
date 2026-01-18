import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/get_cart_response.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entity/cart_entity.dart';
import 'package:route_e_commerce_v2/features/cart/domain/usecase/cart_usecase.dart';
import 'package:route_e_commerce_v2/features/cart/domain/usecase/get_cart_items_usecase.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase _cartUsecase;
  final GetCartItemsUsecase _getCartItemsUsecase;

  CartBloc(this._cartUsecase, this._getCartItemsUsecase)
    : super(CartState.init()) {
    on<CartEvent>((event, emit) async {
      switch (event) {
        case AddToCartEvent():
          {
            emit(state.copyWith(addToCartState: RequestState.loading));
            final result = await _cartUsecase.addToCart(
              event._addToCartRequest,
            );
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    addToCartState: RequestState.error,
                    addToCartFaliure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    addToCartState: RequestState.success,
                    addToCartResponse: r,
                  ),
                );
              },
            );
          }
        case GetCartEvent():
          {
            emit(state.copyWith(getCartState: RequestState.loading));
            final result = await _getCartItemsUsecase.getCart();
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    getCartState: RequestState.error,
                    getCartFaliure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    getCartState: RequestState.success,
                    getCartResponse: r,
                  ),
                );
              },
            );
          }
      }
    });
  }
}
