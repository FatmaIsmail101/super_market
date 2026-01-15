part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCartEvent extends CartEvent {
  AddToCartRequest _addToCartRequest;

  AddToCartEvent(this._addToCartRequest);

  @override
  // TODO: implement props
  List<Object?> get props => [_addToCartRequest.productId];
}

class GetCartEvent extends CartEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
