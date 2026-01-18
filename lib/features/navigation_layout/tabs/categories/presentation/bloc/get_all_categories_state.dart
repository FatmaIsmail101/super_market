part of 'get_all_categories_bloc.dart';

class GetAllCategoriesState {
  GetAllCategoriesState({
    this.getAllCategoriesState,
    this.categoryResponse,
    this.failure,
    this.subCategoriesResponseDto,
    this.subCatState,
    this.subfailure,
    this.selectedCategoryId,
  });

  final RequestState? subCatState;
  final SubCategoriesResponseDto? subCategoriesResponseDto;
  final CommerceFailure? subfailure;
  RequestState? getAllCategoriesState;
  CategoriesResponseDto? categoryResponse;
  String? selectedCategoryId;

  CommerceFailure? failure;

  // TODO: implement props
  // List<Object?> get props => [categoryResponse];

  GetAllCategoriesState copyWith({
    RequestState? getAllCategoriesState,
    CategoriesResponseDto? categoryResponse,
    RequestState? subCatState,
    SubCategoriesResponseDto? subCategoriesResponseDto,
    CommerceFailure? subfailure,
    CommerceFailure? failure,
    String? selectedCategoryId,
  }) {
    return GetAllCategoriesState(
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
      failure: failure ?? this.failure,
      categoryResponse: categoryResponse ?? this.categoryResponse,
      getAllCategoriesState:
          getAllCategoriesState ?? this.getAllCategoriesState,
      subCatState: subCatState ?? this.subCatState,
      subCategoriesResponseDto:
          subCategoriesResponseDto ?? this.subCategoriesResponseDto,
      subfailure: subfailure ?? this.subfailure,
    );
  }

  static GetAllCategoriesState init() {
    return GetAllCategoriesState(getAllCategoriesState: RequestState.init);
  }
}
