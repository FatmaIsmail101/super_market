import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/error_handling/error_handling.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/data/models/category_models/categories_response_dto.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/domain/usecase/get_all_cat_usecase.dart';

import '../../data/models/sub_categories_models/sub_categories_response_dto.dart';
import '../../domain/usecase/subcat_usecase/subcat_usecase.dart';

part 'get_all_categories_event.dart';
part 'get_all_categories_state.dart';

@injectable
class GetAllCategoriesBloc
    extends Bloc<GetAllCategoriesEvent, GetAllCategoriesState> {
  GetAllCategoriesUsecase getAllCategoriesUsecase;
  SubcatUsecase subcatUsecase;

  GetAllCategoriesBloc(this.getAllCategoriesUsecase, this.subcatUsecase)
    : super(GetAllCategoriesState.init()) {
    on<GetAllCategoriesEvent>((event, emit) async {
      switch (event) {
        case GetAllCatEvent():
          {
            emit(state.copyWith(getAllCategoriesState: RequestState.loading));
            final result = await getAllCategoriesUsecase.call();
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    failure: l,
                    getAllCategoriesState: RequestState.error,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    categoryResponse: r,
                    getAllCategoriesState: RequestState.success,
                  ),
                );
                add(GetSubCatEvent(r.categories?.first.id ?? ""));
              },
            );
          }
        case GetSubCatEvent():
          {
            emit(state.copyWith(subCatState: RequestState.loading));

            final result = await subcatUsecase.call(event.id);
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    subCatState: RequestState.error,
                    subfailure: l,
                  ),
                );
              },
              (r) {
                emit(
                  state.copyWith(
                    subCatState: RequestState.success,
                    subCategoriesResponseDto: r,
                    selectedCategoryId: event.id,
                  ),
                );
                //add(GetAllCatEvent(id:event.id??"6439d58a0049ad0b52b9003f"));
              },
            );
          }
      }
    });
  }
}
