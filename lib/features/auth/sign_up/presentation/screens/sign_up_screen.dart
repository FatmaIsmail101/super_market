import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/notification_bar.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/main_text_field.dart';
import '../../../../../core/widgets/validators.dart';
import '../bloc/sign_up_bloc.dart';


class SignUpScreen extends StatelessWidget {
   SignUpScreen({super.key});
  final email=TextEditingController();
  final name=TextEditingController();
  final password=TextEditingController();
  final rePassword=TextEditingController();
  final phone=TextEditingController();
final fomKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if(state.signUpRequestState==RequestState.success){
            NotificationBar.showNotification(message: "Mabrook", type: ContentType.success, context: context, icon: Icons.check);
            Navigator.pushNamed(context, Routes.navigationRoute);
          }
          if(state.signUpRequestState==RequestState.error){
            NotificationBar.showNotification(message: "Something went wrong", type: ContentType.failure, context: context, icon: Icons.error);

          }
          if(state.signUpRequestState==RequestState.loading){
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) =>
                  Center(
                    child: Lottie.asset(
                        "assets/loading.json", width: 150, height: 150),
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
                    key: fomKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          controller: name,
                          hint: 'enter your full name',
                          label: 'Full Name',
                          textInputType: TextInputType.name,
                          validation: AppValidators.validateFullName,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'enter your mobile no.',
                          controller: phone,
                          backgroundColor: ColorManager.white,
                          label: 'Mobile Number',
                          validation: AppValidators.validatePhoneNumber,
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'enter your email address',
                          backgroundColor: ColorManager.white,
                          controller: email,
                          label: 'E-mail address',
                          validation: AppValidators.validateEmail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          controller: password,
                          label: 'password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'Re-password',
                          backgroundColor: ColorManager.white,
                          controller: rePassword,
                          label: 'password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: AppSize.s50.h,
                        ),
                        Center(
                          child: SizedBox(
                            height: AppSize.s60.h,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * .9,
                            child: CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              label: 'Sign Up',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20),
                              onTap: () {
                                if(fomKey.currentState!.validate()){
                                  BlocProvider.of<SignUpBloc>(context).add(
                                      GetSignUpEvent(name: name.text
                                          , phone: phone.text
                                          , email: email.text
                                          , rePassword: rePassword.text
                                          , password: password.text)
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