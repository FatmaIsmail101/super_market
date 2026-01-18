import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/style_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import '../../../data/model/get_favorite_response.dart';
import 'custom_txt_widget.dart';

class FavouriteItemDetails extends StatelessWidget {
  const FavouriteItemDetails({required this.product, super.key});

  final FavoriteProduct product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomTextWgt(
          data: product.title ?? "",
          textStyle: getSemiBoldStyle(
            color: ColorManager.primaryDark,
            fontSize: AppSize.s18.sp,
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: AppSize.s10.w),
              // width: AppSize.s14.w,
              height: AppSize.s14.h,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
            CustomTextWgt(
              data: (product.createdAt) as String,
              textStyle: getMediumStyle(
                color: ColorManager.primaryDark,
                fontSize: AppSize.s14.sp,
              ),
            ),
          ],
        ),
        Row(
          children: [
            CustomTextWgt(
              data: 'EGP ${product.price}  ',
              textStyle: getSemiBoldStyle(
                color: ColorManager.primaryDark,
                fontSize: AppSize.s18.sp,
              ).copyWith(letterSpacing: 0.17),
            ),
            product.sold == null
                ? const SizedBox.shrink()
                : Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: AppSize.s10.h),
                      CustomTextWgt(
                        data: 'EGP ${product.price}',
                        textStyle: getMediumStyle(
                          color: ColorManager.appBarTitleColor.withOpacity(.6),
                        ).copyWith(
                          letterSpacing: 0.17,
                          decoration: TextDecoration.lineThrough,
                          color: ColorManager.appBarTitleColor.withOpacity(.6),
                          fontSize: AppSize.s10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ],
    );
  }
}
