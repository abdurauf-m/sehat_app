import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          'Notifications',
          style: AppStyles.medium16(AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('14.02.2026', style: AppStyles.medium16(AppColors.card)),
              Gap(12.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(AppImages.person, fit: BoxFit.cover),
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        'You have been assigned a new rating for your appearance on 14/02/2026.',
                        style: AppStyles.regular14(AppColors.grey),
                      ),
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '12:03',
                          style: AppStyles.regular12(AppColors.grey),
                        ),
                        Gap(20.h),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryLight.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: SvgPicture.asset(
                          AppIcons.notification,
                          color: AppColors.primaryBright,
                        ),
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(100.r),
                      //   child: Image.asset(AppImages.person, fit: BoxFit.cover),
                      // ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        'You have been assigned a new rating for your appearance on 14/02/2026.',
                        style: AppStyles.regular14(AppColors.grey),
                      ),
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '12:03',
                          style: AppStyles.regular12(AppColors.grey),
                        ),
                        Gap(20.h),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              Text('31.12.2025', style: AppStyles.medium16(AppColors.card)),
              Gap(12.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 50.w,
                      height: 50.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(AppImages.person, fit: BoxFit.cover),
                      ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        'You have been assigned a new rating for your appearance on 14/02/2026.',
                        style: AppStyles.regular14(AppColors.grey),
                      ),
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '12:03',
                          style: AppStyles.regular12(AppColors.grey),
                        ),
                        Gap(20.h),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(8.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryLight.withOpacity(0.3),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: SvgPicture.asset(
                          AppIcons.notification,
                          color: AppColors.primaryBright,
                        ),
                      ),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(100.r),
                      //   child: Image.asset(AppImages.person, fit: BoxFit.cover),
                      // ),
                    ),
                    Gap(8.w),
                    Expanded(
                      child: Text(
                        'You have been assigned a new rating for your appearance on 14/02/2026.',
                        style: AppStyles.regular14(AppColors.grey),
                      ),
                    ),
                    Gap(8.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '12:03',
                          style: AppStyles.regular12(AppColors.grey),
                        ),
                        Gap(20.h),
                        Container(
                          width: 10.w,
                          height: 10.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
