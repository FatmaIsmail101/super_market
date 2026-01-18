import 'package:flutter/material.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';

class HeartButton extends StatefulWidget {
  final void Function()? onTap;

  const HeartButton({super.key, required this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  String heartIcon = ImageAssets.heartIcon;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorManager.white,
      elevation: 5,
      shape: const StadiumBorder(),
      shadowColor: ColorManager.black,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        onTap: () {
          setState(() {
            isClicked = !isClicked;
            // heartIcon =
            //     !isClicked ? ImageAssets.clickedHeartIcon : ImageAssets.heartIcon;
            //
            heartIcon =
                isClicked
                    ? ImageAssets.clickedHeartIcon
                    : ImageAssets.heartIcon;

            widget.onTap?.call();
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Image.asset(heartIcon),
        ),
      ),
    );
  }
}
