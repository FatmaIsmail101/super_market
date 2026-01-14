part of 'get_all_products_bloc.dart';

class GetAllProductsState {
  RequestState? productsState;
  ProductsResponse? productsRespons;
  CommerceFailure? failure;

  GetAllProductsState({this.productsRespons, this.failure, this.productsState});

  GetAllProductsState copyWith({
    RequestState? productsState,
    ProductsResponse? productsRespons,
    CommerceFailure? failure,
  }) {
    return GetAllProductsState(
      failure: failure ?? this.failure,
      productsRespons: productsRespons ?? this.productsRespons,
      productsState: productsState ?? this.productsState,
    );
  }

  static GetAllProductsState init() {
    return GetAllProductsState(productsState: RequestState.loading);
  }
}
