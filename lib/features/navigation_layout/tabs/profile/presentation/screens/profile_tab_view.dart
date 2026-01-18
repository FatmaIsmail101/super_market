import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_e_commerce_v2/core/cache_helper/cache_helper.dart';
import 'package:route_e_commerce_v2/core/widgets/validators.dart';
import 'package:route_e_commerce_v2/features/auth/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/profile/presentation/screens/wideget/data_item.dart';

class ProfileTabView extends StatelessWidget {
  ProfileTabView({super.key});

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final email = CacheHelper.getString("email");
    final name = CacheHelper.getString("name");
    final password = CacheHelper.getString("password");
    final phone = CacheHelper.getString("phone");
    final address = CacheHelper.getString("address");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ${name?.substring(0, 6) ?? ""}",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: Colors.black,
                  ),
                ),
                Text(
                  " ${email ?? ""}",
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            // دلوقتي DataItem هتشوف الاسم لأنه بيقرأ من نفس الـ Bloc اللي موجود
            DataItem(
              hint: "Enter Your New Name",
              label: "Enter Your New Name",
              alertDialogTitle: "Enter Your New Name",
              user: name ?? "",
              title: "Your full name",
              controller: nameController,
              validation: AppValidators.validateFullName,
              onTap: () {
                context.read<SignUpBloc>().add(
                  GetSignUpEvent(name: nameController.text),
                );
                CacheHelper.saveString("name", nameController.text);
              },
            ),
            DataItem(
              hint: "Enter Your New Email",
              label: "Enter Your New Email",
              alertDialogTitle: "Enter Your New Email",
              user: email ?? "",
              title: "E-mail",
              controller: emailController,
              validation: AppValidators.validateEmail,
              onTap: () {
                context.read<SignUpBloc>().add(
                  GetSignUpEvent(email: emailController.text),
                );
                CacheHelper.saveString("email", emailController.text);
              },
            ),
            DataItem(
              label: "Enter Your New Password",
              hint: "Enter Your New Password",
              alertDialogTitle: "Enter Your New Password",
              hidden: true,
              password: password ?? "",
              title: "password",
              controller: passwordController,
              validation: AppValidators.validatePassword,
              onTap: () {
                context.read<SignUpBloc>().add(
                  GetSignUpEvent(
                    password: passwordController.text,
                    rePassword: passwordController.text,
                  ),
                );
                CacheHelper.saveString("password", passwordController.text);
              },
            ),
            DataItem(
              hint: "Enter Your New Phone Number",
              label: "Enter Your New Phone Number",
              alertDialogTitle: "Enter Your New Phone Number",
              user: phone ?? "",
              title: "mobile number",
              controller: phoneController,
              validation: AppValidators.validatePhoneNumber,
              onTap: () {
                context.read<SignUpBloc>().add(
                  GetSignUpEvent(phone: phoneController.text),
                );
                CacheHelper.saveString("phone", phoneController.text);
              },
            ),
            DataItem(
              hint: "Enter Your New Address",
              alertDialogTitle: "Enter Your Address",
              user: address ?? "",
              title: "Address",
              controller: addressController,
              validation: AppValidators.validateFullName,
              onTap: () {
                CacheHelper.saveString("address", addressController.text);
              },
              label: 'Enter Your Address',
            ),
          ],
        ),
      ),
    );
  }
}
