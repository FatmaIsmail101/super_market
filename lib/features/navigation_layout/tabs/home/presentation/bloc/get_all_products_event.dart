part of 'get_all_products_bloc.dart';

sealed class GetAllProductsEvent extends Equatable {
  const GetAllProductsEvent();
}

class GetAllProEvent extends GetAllProductsEvent {
  @override
  List<Object?> get props => [];
}
