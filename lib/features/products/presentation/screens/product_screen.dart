import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/bloc/add_cart_bloc/cart_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/bloc/get_all_products_bloc.dart';

import '../../../../core/constants/di.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../navigation_layout/widgets/home_appbar.dart';
import '../widget/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final model = ModalRoute
    //     .of(context)
    //     ?.settings
    //     .arguments as String?;
    // if (model == null) {
    //   return const Scaffold(
    //     body: Center(child: Text("No product id provided")),
    //   );
    // }
    // print("model:$model");
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) =>
      getIt<CartBloc>()
        ..add(GetCartEvent()),
      child: BlocProvider(
        create: (context) =>
        getIt<GetAllProductsBloc>()
          ..add(GetAllProEvent()),
        child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: const HomeAppbar(tabIndex: 0,),
              body: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: state.productsRespons?.products?.length ?? 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 7 / 9,
                        ),
                        itemBuilder: (context, index) {
                          final product = state.productsRespons!
                              .products![index];

                          return CustomProductWidget(
                            id: state.productsRespons?.products?[index].id ??
                                "",
                            image: product.images?.first ?? "",
                            title: state.productsRespons?.products?[index]
                                .title ?? "",
                            price: state.productsRespons?.products?[index].price
                                ?.toDouble() ?? 0.0,
                            rating: state.productsRespons?.products?[index]
                                .ratingsAverage
                                ?.toDouble() ?? 0.0,
                            discountPercentage: state.productsRespons
                                ?.products?[index].ratingsQuantity
                                ?.toDouble() ?? 0.0,
                            height: height,
                            width: width,
                            description:
                            state.productsRespons?.products?[index]
                                .description ?? "",
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
      ),
    );
  }
}
