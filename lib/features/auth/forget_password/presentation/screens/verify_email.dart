import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:route_e_commerce_v2/core/constants/di.dart';
import 'package:route_e_commerce_v2/core/resources/notification_bar.dart';
import 'package:route_e_commerce_v2/features/auth/forget_password/presentation/bloc/forget_password_bloc.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';

import '../../../../../core/l10n/translations/app_localizations.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/validation.dart';
import '../../../widgets/auth_textfield.dart';

class VerifyEmail extends StatelessWidget {
  VerifyEmail({super.key});

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<ForgetPasswordBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)?.verifyemail ?? "",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 30),
            ),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: true,

          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 20.h,
                      children: [
                        Lottie.asset("assets/Forgot Password.json"),
                        AuthTextField(
                          controller: emailController,
                          title: AppLocalizations.of(context)!.enterYourMail,
                          hintText: AppLocalizations.of(context)!.mail,
                          validator: Validation.validateEmail,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<ForgetPasswordBloc>(
                                context,
                              ).add(VerifyEmailEvent(emailController.text));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.verifyemail,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ],
                    );
                  },

                  listener: (context, state) {
                    print("Current state: ${state.verifyEmailState}");
                    print("Response: ${state.verifyEmailResponse?.statusMsg}");

                    if (state.verifyEmailState == RequestState.loading) {
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
                    // أي حالة غير loading
                    else {
                      // نغلق Loading Dialog لو مفتوح
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }

                      if (state.verifyEmailState == RequestState.error) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          NotificationBar.showNotification(
                            message:
                                state.verifyEmailResponse?.message ?? "حدث خطأ",
                            type: ContentType.failure,
                            context: context,
                            icon: Icons.error,
                          );
                        });
                      }

                      if (state.verifyEmailState == RequestState.success) {
                        Navigator.pushNamed(context, Routes.resetCodeRoute);

                        final response = state.verifyEmailResponse;
                        print("VerifyEmailResponse: ${response?.statusMsg}");

                        if (response != null &&
                            response.statusMsg == "Email sent successfully") {
                          NotificationBar.showNotification(
                            message: response.statusMsg ?? "",
                            type: ContentType.success,
                            context: context,
                            icon: Icons.check,
                          );

                          SchedulerBinding.instance.addPostFrameCallback(
                            (_) {},
                          );
                        }
                      }
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
