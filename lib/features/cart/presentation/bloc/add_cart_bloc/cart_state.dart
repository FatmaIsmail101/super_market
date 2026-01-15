part of 'cart_bloc.dart';

class CartState {
  final RequestState? addToCartState;
  final CartEntity? addToCartResponse;
  final CommerceFailure? addToCartFaliure;
  final RequestState? getCartState;
  final GetCartResponse? getCartResponse;
  final CommerceFailure? getCartFaliure;

  const CartState({
    this.addToCartFaliure,
    this.addToCartResponse,
    this.addToCartState,
    this.getCartFaliure,
    this.getCartResponse,
    this.getCartState,
  });

  static CartState init() {
    return const CartState(addToCartState: RequestState.init);
  }

  CartState copyWith({
    RequestState? addToCartState,
    CartEntity? addToCartResponse,
    CommerceFailure? addToCartFaliure,
    RequestState? getCartState,
    GetCartResponse? getCartResponse,
    CommerceFailure? getCartFaliure,
  }) {
    return CartState(
      addToCartState: addToCartState ?? this.addToCartState,
      addToCartFaliure: addToCartFaliure ?? this.addToCartFaliure,
      addToCartResponse: addToCartResponse ?? this.addToCartResponse,
      getCartFaliure: getCartFaliure ?? this.getCartFaliure,
      getCartResponse: getCartResponse ?? this.getCartResponse,
      getCartState: getCartState ?? this.getCartState,
    );
  }
}
