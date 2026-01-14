import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/bloc/get_all_categories_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/bloc/spacific_product/spacific_product_bloc.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/style_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import 'category_card_item.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoriesBloc, GetAllCategoriesState>(
      builder: (context, state) {
        print(state.categoryResponse?.categories?.length ?? 0);
        if (state.subCatState != RequestState.success) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.subCatState == RequestState.error) {
          return Text(state.subfailure?.message ?? "");
        }
        if (state.subCatState == RequestState.success) {
          final selectedCategory = state.categoryResponse!.categories!
              .firstWhere((c) => c.id == state.selectedCategoryId);

          return SizedBox(
            width: 400,
            child: CustomScrollView(
              slivers: <Widget>[
                // category title
                SliverToBoxAdapter(
                  child: Text(
                    selectedCategory.name ?? "",
                    style: getBoldStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s14,
                    ),
                  ),
                ),
                // the category card
                SliverToBoxAdapter(
                  child: CategoryCardItem(
                    selectedCategory.name ?? "",
                    selectedCategory.image ?? "",
                    goToCategoryProductsListScreen,
                  ),
                ),
                // the grid view of the subcategories
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount:
                        state.subCategoriesResponseDto?.subCategory?.length ??
                        0,
                    (context, index) => SubCategoryItem(
                      state
                              .subCategoriesResponseDto
                              ?.subCategory?[index]
                              .name ??
                          "",
                      id: state.subCategoriesResponseDto?.subCategory?[index]
                          .id ?? "",
                      state
                              .subCategoriesResponseDto
                              ?.subCategory?[index]
                              .slug ??
                          "",
                      goToCategoryProductsListScreen,
                    ),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: AppSize.s8,
                    crossAxisSpacing: AppSize.s8,
                  ),
                ),
              ],
            ),
          );
        }
        return Text("data");
      },
      listener: (context, state) {},
    );
  }

  goToCategoryProductsListScreen(BuildContext context, String id) {
    BlocProvider.of<SpacificProductBloc>(context).add(
        SpacificProductsEvent(id));
  }
}
