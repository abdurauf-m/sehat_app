import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart'; // 1. Import
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/auth/register/register_screen.dart';
import 'package:sehat/src/ui/auth/verification/verification_screen.dart';
import 'package:sehat/src/widget/button_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerPhone = TextEditingController();
  bool isFull = false;
  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.surfaceLight, elevation: 0),
      backgroundColor: AppColors.surfaceLight,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s start with your phone number",
                    style: AppStyles.medium18(AppColors.primaryDark),
                  ),
                  Gap(4.h),
                  Text(
                    "We will text you a code to verify your identity.",
                    style: AppStyles.regular16(AppColors.grey),
                  ),
                  Gap(24.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Phone number",
                          style: AppStyles.medium14(AppColors.primaryDark),
                        ),
                        TextSpan(
                          text: " *",
                          style: AppStyles.medium14(AppColors.error),
                        ),
                      ],
                    ),
                  ),
                  Gap(8.h),
                  TextField(
                    controller: controllerPhone,
                    inputFormatters: [maskFormatter],
                    // 3. Maskani ulash
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      setState(() {
                        isFull = val.length == 17;
                      });
                    },
                    style: AppStyles.medium14(AppColors.primaryDark),
                    decoration: InputDecoration(
                      hintText: "+998 _ _  _ _ _  _ _  _ _",
                      hintStyle: AppStyles.regular16(
                        AppColors.grey.withOpacity(0.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      // Borderlar dizayni
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: Color(0xffE2E8F0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(16.h), // Tugma va matn orasidagi masofa
          Padding(
            padding: EdgeInsets.only(left: 28.0.w, bottom: 24.h),
            child: GestureDetector(
              onTap: () {
                navigatorPush(context, RegisterScreen());
              },
              child: RichText(
                text: TextSpan(
                  style: AppStyles.regular16(AppColors.grey),
                  children: [
                    TextSpan(
                      text: "Don’t have an account? ",
                      style: AppStyles.regular16(AppColors.primaryDark),
                    ),
                    TextSpan(
                      text: "Sign up",
                      style: AppStyles.medium14(AppColors.primary).copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ButtonWidget(
            isActive: isFull,
            buttonText: "Continue",
            onTap: () {
              String fullNumber = maskFormatter.getUnmaskedText();
              navigatorPush(context, VerificationScreen());
            },
          ),
          Gap(34.h),
        ],
      ),
    );
  }
}
