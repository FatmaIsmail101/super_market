// part of 'sub_cat_bloc.dart';
//
// class SubCatState extends Equatable {
//   final RequestState? subCatState;
//   final SubCategoriesResponseDto? subCategoriesResponseDto;
//   final CommerceFailure? failure;
//
//   const SubCatState({
//     this.failure,
//     this.subCategoriesResponseDto,
//     this.subCatState,
//   });
//
//   static SubCatState init() {
//     return SubCatState(subCatState: RequestState.init);
//   }
//
//   SubCatState copyWith({
//     final RequestState? subCatState,
//     final SubCategoriesResponseDto? subCategoriesResponseDto,
//     final CommerceFailure? failure,
//   }) {
//     return SubCatState(
//       subCatState: subCatState ?? this.subCatState,
//       failure: failure ?? this.failure,
//       subCategoriesResponseDto:
//           subCategoriesResponseDto ?? this.subCategoriesResponseDto,
//     );
//   }
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [subCategoriesResponseDto];
// }
//
// final class SubCatInitial extends SubCatState {
//   @override
//   List<Object> get props => [];
// }
