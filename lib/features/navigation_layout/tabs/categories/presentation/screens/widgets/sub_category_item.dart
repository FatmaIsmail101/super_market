import 'package:flutter/material.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/style_manager.dart';
import '../../../../../../../core/resources/values_manager.dart';
import '../../../../../../../core/routing/routes.dart';

class SubCategoryItem extends StatelessWidget {
  final String title;
  final String image;

  //final Function navigation;
  // final String id;

  const SubCategoryItem(this.title,
      this.image,
      // this.navigation,
          {
        super.key,
        //required this.id,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  print("ID Before $id");
        Navigator.of(context, rootNavigator: true).pushNamed(
            Routes.productsScreenRoute);

        //  print("ID After $id");

      }
      , overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(color: ColorManager.primary, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            softWrap: true,
            overflow: TextOverflow.ellipsis,
            title,
            style: getRegularStyle(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
