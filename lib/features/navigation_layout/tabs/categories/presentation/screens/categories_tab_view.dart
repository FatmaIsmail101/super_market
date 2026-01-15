import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/bloc/get_all_categories_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/screens/widgets/categories_list_widget.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/screens/widgets/sub_categories_list.dart';

import '../../../../../../core/constants/di.dart';
import '../../../../../../core/resources/values_manager.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GetAllCategoriesBloc>()..add(GetAllCatEvent()),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p12,
          vertical: AppPadding.p12,
        ),
        child: Row(
          children: [
            const CategoriesListWidget(),
            const SizedBox(width: AppSize.s16),
            Expanded(flex: 2, child: SubCategoriesList()),
          ],
        ),
      ),
    );
  }
}
