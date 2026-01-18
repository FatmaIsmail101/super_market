import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/presentation/bloc/favorite_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/presentation/screens/widgets/favourite_item.dart';

import '../../../../../../core/constants/di.dart';
import '../../../../../../core/resources/values_manager.dart';
import '../../data/model/get_favorite_response.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<FavoriteBloc>()
        ..add(GetFavoriteEvent()),
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
              child: ListView.builder(
                itemCount: state.getFavResponse?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  print("Favorite itemcount:${state.getFavResponse?.data
                      ?.length}");
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child:
                    FavoriteItem(product: state.getFavResponse?.data?[index] ??
                        FavoriteProduct()),
                  );
                },
              ));
        },
      ),
    );
  }
}
