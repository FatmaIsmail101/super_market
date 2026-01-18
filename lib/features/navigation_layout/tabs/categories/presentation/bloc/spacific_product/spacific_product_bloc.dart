import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/product_specific_model/product_specific_model.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/usecase/spacific_product_usecse/spacific_product_usecase.dart';

part 'spacific_product_event.dart';
part 'spacific_product_state.dart';

@injectable
class SpacificProductBloc
    extends Bloc<SpacificProductEvent, SpacificProductState> {
  final SpacificProductUsecase _spacificProductUsecase;

  SpacificProductBloc(this._spacificProductUsecase)
    : super(SpacificProductState.init()) {
    on<SpacificProductsEvent>((event, emit) async {
      emit(state.copyWith(spacificProductState: RequestState.loading));
      final result = await _spacificProductUsecase.call(event.id);
      result.fold(
        (l) {
          emit(
            state.copyWith(
              spacificProductState: RequestState.error,
              failure: l,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              spacificProductState: RequestState.success,
              productSpecificModel: r,
            ),
          );
        },
      );
    });
  }
}
