import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/cart/data/model/add_to_cart_request.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/favorite_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/data/model/get_favorite_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/domain/usecase/favorite_usecase.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteUsecase _favoriteUsecase;

  FavoriteBloc(this._favoriteUsecase) : super(FavoriteState.init()) {
    on<FavoriteEvent>((event, emit) async {
      switch (event) {
        case AddFavoriteEvent():
          {
            emit(state.copyWith(addFavState: RequestState.loading));
            final result = await _favoriteUsecase.call(
              AddToCartRequest(productId: event.id),
            );
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    addFavState: RequestState.error,
                    addFavFaliure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    addFavState: RequestState.success,
                    addFavResponse: r,
                  ),
                );
              },
            );
          }
        case GetFavoriteEvent():
          {
            emit(state.copyWith(getFavState: RequestState.loading));
            final result = await _favoriteUsecase.getFav();
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    getFavState: RequestState.error,
                    getFavFaliure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    getFavState: RequestState.success,
                    getFavResponse: r,
                  ),
                );
              },
            );
          }
      }
    });
  }
}
