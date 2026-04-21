import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/model/onboarding_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/auth/login/login_screen.dart';
import 'package:sehat/src/widget/button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  List<OnboardingModel> onboarding = [
    OnboardingModel(
      image: AppImages.onboard1,
      name: "Verified",
      title: " professional doctors",
      description:
          "Every physician is board-certified, peer-reviewed and carefully vetted for your safety",
    ),
    OnboardingModel(
      image: AppImages.onboard2,
      name: "Premium",
      title: " professional healthcare",
      description:
          "World-class facilities, cutting-edge technology and accredited care-all in one place",
    ),
    OnboardingModel(
      image: AppImages.onboard3,
      name: "Your rewards",
      title: " for choosing our care",
      description:
          "Collect Loyalty Points each time you book an appointment or refer friends. Use points to pay for services.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: onboarding.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = onboarding[index];

                    return Column(
                      children: [
                        SizedBox(height: 20.h),

                        /// IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.r),
                          child: Image.asset(
                            data.image,
                            height: 260.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Gap(44.h),

                        /// TITLE
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: data.name,
                                style: AppStyles.medium36(AppColors.accentPink),
                              ),
                              TextSpan(
                                text: data.title,
                                style: AppStyles.medium36(
                                  AppColors.overlayDark,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 16.h),

                        Text(
                          data.description,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.overlayDark,
                          ),
                        ),

                        SizedBox(height: 30.h),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboarding.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    width: currentIndex == index ? 22.w : 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
              Gap(60.h),
              ButtonWidget(
                buttonText: "Next",
                onTap: () {
                  if (currentIndex == onboarding.length - 1) {
                    navigatorPushAndRemoveUntil(context, LoginScreen());
                  } else {
                    controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
              Gap(60.h),
            ],
          ),
        ),
      ),
    );
  }
}
