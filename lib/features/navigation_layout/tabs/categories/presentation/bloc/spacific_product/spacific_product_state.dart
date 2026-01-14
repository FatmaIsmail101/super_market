part of 'spacific_product_bloc.dart';

class SpacificProductState {
  final RequestState? spacificProductState;
  final ProductSpecificModel? productSpecificModel;
  final CommerceFailure? failure;

  const SpacificProductState({
    this.productSpecificModel,
    this.failure,
    this.spacificProductState,
  });

  static SpacificProductState init() {
    return const SpacificProductState(
      spacificProductState: RequestState.loading,
    );
  }

  SpacificProductState copyWith({
    RequestState? spacificProductState,
    ProductSpecificModel? productSpecificModel,
    CommerceFailure? failure,
  }) {
    return SpacificProductState(
      spacificProductState: spacificProductState ?? this.spacificProductState,
      failure: failure ?? this.failure,
      productSpecificModel: productSpecificModel ?? this.productSpecificModel,
    );
  }
}
