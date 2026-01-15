part of 'favorite_bloc.dart';

class FavoriteState {
  RequestState? addFavState;
  FavoriteResponse? addFavResponse;
  CommerceFailure? addFavFaliure;
  RequestState? getFavState;
  GetFavoriteResponse? getFavResponse;
  CommerceFailure? getFavFaliure;

  FavoriteState({
    this.addFavState,
    this.addFavResponse,
    this.addFavFaliure,
    this.getFavFaliure,
    this.getFavResponse,
    this.getFavState,
  });

  static FavoriteState init() {
    return FavoriteState(addFavState: RequestState.init);
  }

  FavoriteState copyWith({
    RequestState? addFavState,
    FavoriteResponse? addFavResponse,
    CommerceFailure? addFavFaliure,
    RequestState? getFavState,
    GetFavoriteResponse? getFavResponse,
    CommerceFailure? getFavFaliure,
  }) {
    return FavoriteState(
      addFavState: addFavState ?? this.addFavState,
      addFavResponse: addFavResponse ?? this.addFavResponse,
      addFavFaliure: addFavFaliure ?? this.addFavFaliure,
      getFavFaliure: getFavFaliure ?? this.getFavFaliure,
      getFavResponse: getFavResponse ?? this.getFavResponse,
      getFavState: getFavState ?? this.getFavState,
    );
  }
}
