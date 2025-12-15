import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/presentation/bloc/forget_password_bloc.dart';

import '../../../../../core/constants/di.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/notification_bar.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../../../core/widgets/validators.dart';
import '../../../sign_up/presentation/bloc/sign_up_bloc.dart';

class ForgetPassword extends StatelessWidget {
  final currentPassword = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ForgetPasswordBloc>(),
      child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state.updatePasswordState == RequestState.success) {
            NotificationBar.showNotification(
              message: "Mabrook",
              type: ContentType.success,
              context: context,
              icon: Icons.check,
            );
            Navigator.pushNamed(context, Routes.loginRoute);
          }
          if (state.updatePasswordState == RequestState.error) {
            NotificationBar.showNotification(
              message: "Something went wrong",
              type: ContentType.failure,
              context: context,
              icon: Icons.error,
            );
          }
          if (state.updatePasswordState == RequestState.loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (_) => Center(
                    child: Lottie.asset(
                      "assets/loading.json",
                      width: 150,
                      height: 150,
                    ),
                  ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSize.s40.h),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(height: AppSize.s40.h),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          controller: currentPassword,
                          hint: 'enter your current password',
                          label: 'Current Password',
                          textInputType: TextInputType.name,
                          // validation: AppValidators.validatePassword,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your new password',
                          controller: password,
                          backgroundColor: ColorManager.white,
                          label: 'New Password',
                          validation: AppValidators.validatePassword,
                        ),
                        SizedBox(height: AppSize.s18.h),
                        BuildTextField(
                          hint: 'enter your RePassword ',
                          backgroundColor: ColorManager.white,
                          controller: rePassword,
                          label: 'RePassword',
                          validation: AppValidators.validatePassword,
                        ),
                        SizedBox(height: AppSize.s18.h),

                        Center(
                          child: SizedBox(
                            height: AppSize.s60.h,
                            width: MediaQuery.of(context).size.width * .9,
                            child: CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              label: 'Update Password',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                color: ColorManager.primary,
                                fontSize: AppSize.s20,
                              ),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<ForgetPasswordBloc>(
                                    context,
                                  ).add(
                                    UpdatePasswordEvent(
                                      currentPassword: currentPassword.text,
                                      rePassword: rePassword.text,
                                      password: password.text,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
