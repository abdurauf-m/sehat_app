import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/analyses/analyses_screen.dart';
import 'package:sehat/src/ui/main/booking/booking_screen.dart';
import 'package:sehat/src/ui/main/chat/chat_screen.dart';
import 'package:sehat/src/ui/main/home/home_screen.dart';
import 'package:sehat/src/ui/main/home/profile/edit_profile_screen.dart';
import 'package:sehat/src/ui/main/home/refer_screen.dart';
import 'package:sehat/src/ui/main/services/services_screen.dart';
import 'package:sehat/src/ui/splash/splash_screen.dart';
import 'package:sehat/src/utils/cache_services.dart';

class MainScreen extends StatefulWidget {
  final int currentIndex;
  const MainScreen({super.key, this.currentIndex = 0});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int currentScreen;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    currentScreen = widget.currentIndex;

    screens = [
      HomeScreen(scaffoldKey: key),
      ServicesScreen(),
      BookingScreen(),
      AnalysesScreen(),
      const SizedBox(),
    ];
  }

  void onTabTap(int index) {
    if (index == 4) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChatScreen()),
      );
      return;
    }
    setState(() => currentScreen = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          elevation: 0,
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          child: Column(
            children: [
              Gap(50.h),
              Container(
                width: 100.w,
                height: 100.h,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.grey.withOpacity(0.7),
                ),
                child: Image.asset(AppImages.avatar, fit: BoxFit.cover),
              ),
              Gap(8.h),
              Text("Sarah Johnson", style: AppStyles.medium20(AppColors.card)),
              Text("ID : 1233455", style: AppStyles.regular16(AppColors.grey)),
              Gap(12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Color(0x0A000000),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigatorPop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppIcons.homeUnactive,
                            color: AppColors.black,
                            width: 24.w,
                            height: 24.h,
                          ),
                          Gap(10.w),
                          Text(
                            "Home",
                            style: AppStyles.regular12(AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    Gap(5.h),
                    Divider(color: AppColors.greySoft),
                    Gap(5.h),
                    GestureDetector(
                      onTap: () {
                        navigatorPop(context);

                        navigatorPush(context, EditProfileScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.person_outline, size: 24.sp),
                          Gap(10.w),
                          Text(
                            "Edit Profile",
                            style: AppStyles.regular12(AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    Gap(5.h),
                    Divider(color: AppColors.greySoft),
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppIcons.lan,
                          color: AppColors.black,
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(10.w),
                        Text(
                          "Language",
                          style: AppStyles.regular12(AppColors.black),
                        ),
                        Spacer(),
                        RotatedBox(
                          quarterTurns: 45,
                          child: Icon(Icons.chevron_right_outlined),
                        ),
                      ],
                    ),
                    Gap(5.h),
                    Divider(color: AppColors.greySoft),
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        SvgPicture.asset(
                          AppIcons.customerSupport,
                          color: AppColors.black,
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(10.w),
                        Text(
                          "Support",
                          style: AppStyles.regular12(AppColors.black),
                        ),
                      ],
                    ),
                    Gap(5.h),
                    Divider(color: AppColors.greySoft),
                    Gap(5.h),
                    GestureDetector(
                      onTap: () {
                        navigatorPop(context);
                        navigatorPush(context, ReferScreen());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          SvgPicture.asset(
                            AppIcons.gift2,
                            color: AppColors.black,
                            width: 24.w,
                            height: 24.h,
                          ),
                          Gap(10.w),
                          Text(
                            "Refer a friend",
                            style: AppStyles.regular12(AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    Gap(5.h),
                    Divider(color: AppColors.greySoft),
                    Gap(5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        SvgPicture.asset(
                          AppIcons.information,
                          color: AppColors.black,
                          width: 24.w,
                          height: 24.h,
                        ),
                        Gap(10.w),
                        Text(
                          "About application",
                          style: AppStyles.regular12(AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GestureDetector(
                  onTap: () async {
                    navigatorPushAndRemoveUntil(context, SplashScreen());
                    await CacheService.removeLogin();
                    await CacheService.removeToken();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppIcons.logout,
                        width: 30.w,
                        height: 30.h,
                      ),
                      Gap(10.w),
                      Text(
                        "Log Out",
                        style: AppStyles.regular12(AppColors.error),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      key: key,
      backgroundColor: AppColors.white,
      extendBody: true,
      body: IndexedStack(index: currentScreen, children: screens),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 30.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            height: 74.h,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  AppIcons.homeActive,
                  AppIcons.homeUnactive,
                  "Home",
                  0,
                ),
                _buildNavItem(
                  AppIcons.healtActive,
                  AppIcons.healtUnactive,
                  "Services",
                  1,
                ),
                _buildNavItem(
                  AppIcons.timeActive,
                  AppIcons.timeUnactive,
                  "Booking",
                  2,
                ),
                _buildNavItem(
                  AppIcons.dnaActive,
                  AppIcons.dnaUnactive,
                  "Analyses",
                  3,
                ),
                _buildNavItem(
                  AppIcons.messageUnactive,
                  AppIcons.messageUnactive,
                  "Chat",
                  4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    String activeIcon,
    String unActiveIcon,
    String label,
    int index,
  ) {
    bool isSelected = currentScreen == index;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTabTap(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isSelected ? activeIcon : unActiveIcon,
              width: 22.w,
              height: 22.h,
            ),
            Gap(6.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? AppColors.primary : Colors.black38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
