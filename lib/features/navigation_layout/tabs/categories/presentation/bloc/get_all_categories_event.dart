part of 'get_all_categories_bloc.dart';

sealed class GetAllCategoriesEvent extends Equatable {
  const GetAllCategoriesEvent();
}

class GetAllCatEvent extends GetAllCategoriesEvent {
  String? id;

  GetAllCatEvent({this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetSubCatEvent extends GetAllCategoriesEvent {
  String id;

  GetSubCatEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
