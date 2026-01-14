import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/bloc/get_all_categories_bloc.dart';

import '../../../../../../core/constants/di.dart';
import 'category_widget.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    //final List<Category> categories = DummyDataProvider.generateCategories();
    return BlocProvider(
      create: (context) =>
      getIt<GetAllCategoriesBloc>()
        ..add(GetAllCatEvent()),
      child: BlocBuilder<GetAllCategoriesBloc, GetAllCategoriesState>(
        builder: (context, state) {
          print(
              'Brand list length: ${state.categoryResponse?.categories
                  ?.length}');

          if (state.getAllCategoriesState == RequestState.loading) {
            return Center(child: Lottie.asset("assets/Insider-loading.json"));
          }
          if (state.getAllCategoriesState == RequestState.error) {
            return Center(
              child: Text(
                "No Data",
                style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20),
              ),
            );
          }
          if (state.getAllCategoriesState == RequestState.success) {
            return SizedBox(
              height: 260,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),

                // مهم مع CustomScrollView
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,

                  //سبب ل over flow
                  childAspectRatio: 1.4,
                ),
                itemBuilder: (context, index) {
                  final brand = state.categoryResponse!.categories![index];
                  return CategoryWidget(category: brand.toEntity());
                },
                scrollDirection: Axis.horizontal,
                itemCount: state.categoryResponse?.categories?.length ?? 0,
              ),
            );
          }
          return Center(
            child: Text(
              "No Data",
              style: GoogleFonts.aBeeZee(color: Colors.black, fontSize: 20),
            ),
          );
        },
      ),
    );
  }
}
