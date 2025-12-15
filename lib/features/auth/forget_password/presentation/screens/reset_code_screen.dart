import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/constants/di.dart';
import '../../../../../core/l10n/translations/app_localizations.dart';
import '../../../../../core/resources/notification_bar.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/validation.dart';
import '../../../sign_up/presentation/bloc/sign_up_bloc.dart';
import '../../../widgets/auth_textfield.dart';
import '../bloc/forget_password_bloc.dart';

class ResetCodeScreen extends StatelessWidget {
  ResetCodeScreen({super.key});

  final resetCodeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => getIt<ForgetPasswordBloc>(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)?.resetcode ?? "",
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
                          controller: resetCodeController,
                          title: AppLocalizations.of(context)!.resetcode,
                          hintText: AppLocalizations.of(context)!.resetcode,
                          // validator: Validation.,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<ForgetPasswordBloc>(
                                context,
                              ).add(ResetCodeEvent(resetCodeController.text));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blue,
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.resetcode,
                            style: Theme.of(context).textTheme.titleMedium!
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ],
                    );
                  },

                  listener: (context, state) {
                    print("restCodeState: ${state.restCodeState}");

                    if (state.restCodeState == RequestState.loading) {
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

                    if (state.restCodeState == RequestState.error) {
                      Navigator.pop(context);
                      NotificationBar.showNotification(
                        message: state.resetCodeResponse?.message ?? "حدث خطأ",
                        type: ContentType.failure,
                        context: context,
                        icon: Icons.error,
                      );
                    }

                    if (state.restCodeState == RequestState.success) {
                      Navigator.pop(context);

                      Navigator.pushNamed(context, Routes.forgetPasswordRoute);
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
