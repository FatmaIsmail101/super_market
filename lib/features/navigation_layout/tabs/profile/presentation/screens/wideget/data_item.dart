import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/widgets/main_text_field.dart';
import '../../../../../../../core/widgets/validators.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    this.user = "",
    required this.controller,
    required this.validation,
    required this.title,
    this.hidden = false,
    this.password = "",
    required this.onTap,
    required this.alertDialogTitle,
    required this.hint,
    required this.label,
  });

  final String user;
  final String title;
  final String password;
  final bool hidden;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final VoidCallback onTap;
  final String alertDialogTitle;
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: <Widget>[
        Text(
          "Your $title",
          style: theme.textTheme.headlineLarge?.copyWith(color: Colors.black),
          textAlign: TextAlign.start,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.blueAccent.shade100,
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hidden
                  ? Text(
                    '*' * password.length,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  )
                  : Text(
                    user,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.black,
                    ),
                  ),
              InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: true,
                    // false = user must tap button, true = tap outside dialog
                    builder: (BuildContext dialogContext) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,

                        backgroundColor: Colors.white,
                        titlePadding: EdgeInsets.all(10.w),

                        title: Text(
                          alertDialogTitle,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        content: SizedBox(
                          height: 100.h,
                          child: BuildTextField(
                            backgroundColor: ColorManager.white,
                            controller: controller,
                            hint: hint,
                            label: label,
                            isObscured: hidden,
                            textInputType: TextInputType.name,
                            validation: AppValidators.validateFullName,
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Done'),
                            onPressed: () {
                              Navigator.of(dialogContext).pop();
                              // Dismiss alert dialog
                              onTap();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Image.asset(AppImages.editIcon),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
