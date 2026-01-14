import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/categories/presentation/bloc/spacific_product/spacific_product_bloc.dart';

import '../../../../core/constants/di.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widgets/home_screen_app_bar.dart';
import '../widget/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final model = ModalRoute
        .of(context)
        ?.settings
        .arguments as String?;
    if (model == null) {
      return Scaffold(
        body: Center(child: Text("No product id provided")),
      );
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print("model:$model");
    return BlocProvider(
      create: (context) =>
      getIt<SpacificProductBloc>()
        ..add(SpacificProductsEvent(model)),
      child: BlocBuilder<SpacificProductBloc, SpacificProductState>(
        builder: (context, state) {
    return Scaffold(
      appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 7 / 9,
                ),
                itemBuilder: (context, index) {
                  return CustomProductWidget(
                    image: state.productSpecificModel?.images?[index] ?? "",
                    title: state.productSpecificModel?.title?[index] ?? "",
                    price: state.productSpecificModel?.price?.toDouble() ?? 0.0,
                    rating: state.productSpecificModel?.ratingsAverage
                        ?.toDouble() ?? 0.0,
                    discountPercentage: state.productSpecificModel
                        ?.ratingsQuantity?.toDouble() ?? 0.0,
                    height: height,
                    width: width,
                    description:
                    state.productSpecificModel?.description ?? "",
                  );
                },
                scrollDirection: Axis.vertical,
              ),
            ),
          ],
        ),
      ),
    );
        },
      ),
    );
  }
}
