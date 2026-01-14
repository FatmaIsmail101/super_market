import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_response.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/domain/usecase/get_all_products_usecase.dart';

part 'get_all_products_event.dart';
part 'get_all_products_state.dart';

@injectable
class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsUsecase productsUsecase;

  GetAllProductsBloc(this.productsUsecase) : super(GetAllProductsState.init()) {
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
  }
}
