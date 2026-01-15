part of 'get_all_products_bloc.dart';

sealed class GetAllProductsEvent extends Equatable {
  const GetAllProductsEvent();
}

class GetAllProEvent extends GetAllProductsEvent {
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends GetAllProductsEvent {
  String id;

  AddToCartEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}