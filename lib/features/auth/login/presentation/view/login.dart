import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:route_e_commerce_v2/core/l10n/translations/app_localizations.dart';
import 'package:route_e_commerce_v2/core/routing/routes.dart';
import 'package:route_e_commerce_v2/core/theme/app_colors.dart';
import 'package:route_e_commerce_v2/core/utils/app_assets.dart';
import 'package:route_e_commerce_v2/core/utils/validation.dart';
import 'package:route_e_commerce_v2/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/auth/widgets/auth_textfield.dart';

import '../../../../../core/constants/di.dart';
import '../../../../../core/resources/notification_bar.dart';

class Login extends StatelessWidget {
  Login({super.key});

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.loginRequestState == RequestState.error) {
            NotificationBar.showNotification(
              message: "Something went wrong",
              type: ContentType.failure,
              context: context,
              icon: Icons.error,
            );
          }
          if (state.loginRequestState == RequestState.success) {
            NotificationBar.showNotification(
              message: "Mabrook",
              type: ContentType.success,
              context: context,
              icon: Icons.check,
            );
            Navigator.pushNamed(context, Routes.navigationRoute);
          }
          if (state.loginRequestState == RequestState.loading) {
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
            backgroundColor: AppColors.blue,
            body: Form(
              key: formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(AppImages.logo),
                        const SizedBox(height: 80),

                        Text(
                          AppLocalizations.of(context)!.welcomeBackToRoute,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(color: AppColors.white),
                        ),

                        Text(
                          AppLocalizations.of(
                            context,
                          )!.pleaseSignInWithYourMail,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 40),

                        AuthTextField(
                          controller: emailController,
                          title: AppLocalizations.of(context)!.enterYourMail,
                          hintText: AppLocalizations.of(context)!.mail,
                          validator: Validation.validateEmail,
                        ),
                        const SizedBox(height: 40),
                        AuthTextField(
                          controller: passwordController,
                          title:
                              AppLocalizations.of(context)!.enterYourPassword,
                          hintText: AppLocalizations.of(context)!.password,
                          validator: Validation.validatePassword,
                          obscureText: true,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // TODO:  Navigate to forget password
                                Navigator.pushNamed(
                                    context, Routes.verifyEmailRoute);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.forgetPassword,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 56),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                GetLoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.signIn,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.darkBlue),
                          ),
                        ),

                        const SizedBox(height: 32),

                        Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.dontHaveAnAccount,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            TextButton(
                              onPressed: () {
                                // TODO:  Navigate to create account
                                Navigator.pushNamed(
                                  context,
                                  Routes.signUpRoute,
                                );
                              },

                              child: Text(
                                AppLocalizations.of(context)!.createAccount,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge?.copyWith(fontSize: 10),
                              ),
                            ),
                          ],
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
