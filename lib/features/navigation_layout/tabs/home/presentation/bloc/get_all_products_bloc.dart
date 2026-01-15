import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/cart/domain/usecase/cart_usecase.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/domain/usecase/get_all_products_usecase.dart';

import '../../../../../cart/domain/entity/cart_entity.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

@injectable
class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsUsecase productsUsecase;
  CartUsecase cartUsecase;

  GetAllProductsBloc(this.productsUsecase, this.cartUsecase)
      : super(GetAllProductsState.init()) {
    on<GetAllProEvent>((event, emit) async {
      emit(state.copyWith(productsState: RequestState.loading));
      final result = await productsUsecase.call();
      result.fold(
        (l) {
          emit(state.copyWith(productsState: RequestState.error, failure: l));
        },
        (r) {
          emit(
            state.copyWith(
              productsState: RequestState.success,
              productsRespons: r,
            ),
          );
        },
      );
    });
    on<AddToCartEvent>((event, emit) async {
      emit(state.copyWith(addToCartState: RequestState.loading));
      final result = await cartUsecase.addToCart(
          AddToCartRequest(productId: event.id));
      result.fold((l) {
        emit(state.copyWith(
            addToCartState: RequestState.error, addToCartFaliure: l));
      }, (r) {
        emit(state.copyWith(
            addToCartState: RequestState.success, addToCartResponse: r));
      });
    });
  }
}
