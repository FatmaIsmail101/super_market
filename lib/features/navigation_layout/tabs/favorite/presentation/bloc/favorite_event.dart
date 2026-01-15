part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class AddFavoriteEvent extends FavoriteEvent {
  String id;

  AddFavoriteEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class GetFavoriteEvent extends FavoriteEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
