import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';

class LayaltHistoryScreen extends StatefulWidget {
  const LayaltHistoryScreen({super.key});

  @override
  State<LayaltHistoryScreen> createState() => _LayaltHistoryScreenState();
}

class _LayaltHistoryScreenState extends State<LayaltHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          'Points History',
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '24 FEBRUARY',
              style: AppStyles.regular14(AppColors.primaryDark),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: Image.asset(AppImages.heart, fit: BoxFit.cover),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cardiology',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        'Dr. Emily Carter',
                        style: AppStyles.regular14(AppColors.primaryDark),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '-45,000 UZS',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        '+450 UZS',
                        style: AppStyles.regular14(AppColors.accentPink),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Text(
              '10 FEBRUARY',
              style: AppStyles.regular14(AppColors.primaryDark),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: Image.asset(AppImages.teath, fit: BoxFit.cover),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stamatology',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        'Dr. Lucas Bennett',
                        style: AppStyles.regular14(AppColors.primaryDark),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '-100,000 UZS',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        '+1.000 UZS',
                        style: AppStyles.regular14(AppColors.accentPink),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Text(
              '1 FEBRUARY',
              style: AppStyles.regular14(AppColors.primaryDark),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.accentPink.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppIcons.userAdd),
                    ),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Friend Referral',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        'For inviting Sarah J.',
                        style: AppStyles.regular14(AppColors.primaryDark),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    '+1.000 UZS',
                    style: AppStyles.bold14(AppColors.accentPink),
                  ),
                ],
              ),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColors.accentPink.withOpacity(0.4),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SvgPicture.asset(AppIcons.userAdd),
                    ),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Friend Referral',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        'For inviting Sarah J.',
                        style: AppStyles.regular14(AppColors.primaryDark),
                      ),
                    ],
                  ),
                  Spacer(),
                  Text(
                    '+1.000 UZS',
                    style: AppStyles.bold14(AppColors.accentPink),
                  ),
                ],
              ),
            ),
            Gap(16.h),
            Text(
              '10 January',
              style: AppStyles.regular14(AppColors.primaryDark),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 40.w,
                    height: 40.h,
                    child: Image.asset(AppImages.eye, fit: BoxFit.cover),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stamatology',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        'Dr. Lucas Bennett',
                        style: AppStyles.regular14(AppColors.primaryDark),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '-100,000 UZS',
                        style: AppStyles.medium16(AppColors.primaryDark),
                      ),
                      Gap(2.h),
                      Text(
                        '+1.000 UZS',
                        style: AppStyles.regular14(AppColors.accentPink),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
