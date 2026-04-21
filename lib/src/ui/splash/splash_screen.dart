import 'package:flutter/material.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/splash/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      navigatorPushAndRemoveUntil(context, OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(child: Image.asset(AppImages.appIcon)),
    );
  }
}
