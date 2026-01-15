import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/widgets/custom_search_field.dart';

import '../../features/cart/presentation/bloc/add_cart_bloc/cart_bloc.dart';

class SearchAndCartWidget extends StatelessWidget {
  const SearchAndCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        spacing: 8,
        children: [
          const Expanded(child: CustomSearchField()),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return Badge(
                textColor: Colors.white,
                label: Text(
                  state.getCartResponse?.numOfCartItems.toString() ?? "",
                  style: GoogleFonts.aBeeZee(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),),
                child: SvgPicture.asset(AppSvgs.cartIcon),);
            },
          )
        ],
      ),
    );
  }
}
