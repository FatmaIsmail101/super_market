part of 'spacific_product_bloc.dart';

abstract class SpacificProductEvent extends Equatable {
  const SpacificProductEvent();
}

class SpacificProductsEvent extends SpacificProductEvent {
  String id;

  SpacificProductsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
