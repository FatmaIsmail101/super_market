import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_product_card.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_model.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/presentation/bloc/get_all_products_bloc.dart';

import '../../../../../../core/constants/di.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    //final List<Product> products = DummyDataProvider.generateProducts();
    return BlocProvider(
      create: (context) => getIt<GetAllProductsBloc>()..add(GetAllProEvent()),
      child: BlocBuilder<GetAllProductsBloc, GetAllProductsState>(
        builder: (context, state) {
          if (state.productsState == RequestState.loading) {
            return Lottie.asset("assets/loading.json");
          }
          if (state.productsState == RequestState.success) {
            return SizedBox(
              height: 350.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.productsRespons?.products?.length ?? 0,
                itemExtent: 186,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CustomProductCard(
                      product:
                          state.productsRespons?.products?[index] ??
                          ProductModel(),
                    ),
                  );
                },
              ),
            );
          }
          if (state.productsState == RequestState.error) {
            return const Text("Something went wrong");
          }
          return const Text("Something went wrong");
        },
      ),
    );
  }
}
