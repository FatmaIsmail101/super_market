import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/bloc/get_all_categories_bloc.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import 'category_item.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({super.key});

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllCategoriesBloc, GetAllCategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                left: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                bottom: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
            ),

            // the categories items list
            child: ClipRRect(
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),

              child: ListView.builder(
                itemCount: state.categoryResponse?.categories?.length ?? 0,
                itemBuilder:
                    (context, index) => CategoryItem(
                      index,
                      state.categoryResponse?.categories?[index].name ?? "",
                      selectedIndex == index,
                      onItemClick,
                      state.categoryResponse?.categories?[index].id ?? "",
                      //onItemClick,
                    ),
              ),
            ),
          ),
        );
      },
    );
  }

  // callback function to change the selected index
    onItemClick(int index, id) {
    BlocProvider.of<GetAllCategoriesBloc>(context).add(GetSubCatEvent(id));

    setState(() {
      selectedIndex = index;
    });
  }
}
