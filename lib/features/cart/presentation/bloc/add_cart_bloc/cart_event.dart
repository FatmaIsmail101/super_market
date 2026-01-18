part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

class AddToCartEvent extends CartEvent {
  final AddToCartRequest _addToCartRequest;

  const AddToCartEvent(this._addToCartRequest);

  @override
  // TODO: implement props
  List<Object?> get props => [_addToCartRequest.productId];
}

class GetCartEvent extends CartEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
