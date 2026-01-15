part of 'get_all_products_bloc.dart';

class GetAllProductsState {
  RequestState? productsState;
  ProductsResponse? productsRespons;
  CommerceFailure? failure;
  final RequestState ?addToCartState;
  final CartEntity ? addToCartResponse;
  final CommerceFailure ?addToCartFaliure;

  GetAllProductsState({this.productsRespons, this.failure, this.productsState,
    this.addToCartResponse, this.addToCartFaliure, this.addToCartState});

  GetAllProductsState copyWith({
    RequestState? productsState,
    ProductsResponse? productsRespons,
    CommerceFailure? failure,
    RequestState ?addToCartState,
    CartEntity ? addToCartResponse,
    CommerceFailure ?addToCartFaliure
  }) {
    return GetAllProductsState(
      failure: failure ?? this.failure,
      productsRespons: productsRespons ?? this.productsRespons,
      productsState: productsState ?? this.productsState,
        addToCartResponse: addToCartResponse ?? this.addToCartResponse,
        addToCartFaliure: addToCartFaliure ?? this.addToCartFaliure,
        addToCartState: addToCartState ?? this.addToCartState
    );
  }

  static GetAllProductsState init() {
    return GetAllProductsState(productsState: RequestState.loading);
  }
}
