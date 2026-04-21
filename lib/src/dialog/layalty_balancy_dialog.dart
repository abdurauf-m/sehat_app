import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/dialog/pay_with_friends_dialog.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/home/layalt/layalt_history_screen.dart';
import 'package:sehat/src/ui/main/home/refer_screen.dart';

class LayaltyBalancyDialog {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return _content(context);
      },
    );
  }

  static Widget _content(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 742.75.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.h),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'What are',
                      style: AppStyles.bold24(AppColors.primaryDark),
                    ),
                    TextSpan(
                      text: ' Loyalty balance',
                      style: AppStyles.bold24(AppColors.accentPink),
                    ),
                    TextSpan(
                      text: ' points?',
                      style: AppStyles.bold24(AppColors.primaryDark),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Text(
                textAlign: TextAlign.center,
                'Loyalty Balance Points are your rewards for choosing our care and referring your friends to the clinic.',
                style: AppStyles.regular16(AppColors.grey),
              ),
              Gap(16.h),
              Center(
                child: Container(
                  width: 200.w,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999.r),
                    color: AppColors.surfaceLight,
                    border: Border.all(color: Color(0xffF1F5F9)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '1 Friend = 1,000 UZS',
                    style: AppStyles.regular16(AppColors.primaryDark),
                  ),
                ),
              ),
              Gap(16.h),
              GestureDetector(
                onTap: () {
                  navigatorPop(context);
                  navigatorPush(context, LayaltHistoryScreen());
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9999.r),
                    color: AppColors.surfaceLight,
                    border: Border.all(color: Color(0xffF1F5F9)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'View Points History',
                    style: AppStyles.medium16(AppColors.primaryDark),
                  ),
                ),
              ),
              Gap(24.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.all(16.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  color: AppColors.accentPink,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total Loyalty Balance Points',
                              style: AppStyles.regular16(
                                AppColors.surfaceLight,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '150,000',
                                    style: AppStyles.bold36(AppColors.white),
                                  ),
                                  TextSpan(
                                    text: ' UZS',
                                    style: AppStyles.regular18(AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.favorite,
                          color: AppColors.white.withOpacity(0.4),
                        ),
                      ],
                    ),
                    Gap(16.h),
                    GestureDetector(
                      onTap: () {
                        navigatorPop(context);
                        PayWithFriendsDialog.show(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 16.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(9999.r),
                          color: AppColors.white.withOpacity(0.4),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Pay with balance',
                          style: AppStyles.medium16(AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              Text(
                'How to earn',
                style: AppStyles.medium18(AppColors.primaryDark),
              ),
              Gap(16.h),
              Container(
                padding: EdgeInsets.all(10.w),
                width: 1.sw,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.greyUltraLight,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          AppIcons.calendarFavorite,
                          color: AppColors.accentPink,
                        ),
                      ),
                    ),
                    Gap(10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Visit the Clinic',
                            style: AppStyles.medium18(AppColors.primaryDark),
                          ),
                          Gap(4.h),
                          Text(
                            'Get up to 5% back in points for every consultation or procedure.',
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              GestureDetector(
                onTap: () {
                  navigatorPop(context);
                  navigatorPush(context, ReferScreen());
                },
                child: Container(
                  padding: EdgeInsets.all(10.w),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.greyUltraLight,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 44.w,
                        height: 44.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            AppIcons.userAdd,
                            color: AppColors.accentPink,
                          ),
                        ),
                      ),
                      Gap(10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Refer a Friend',
                              style: AppStyles.medium18(AppColors.primaryDark),
                            ),
                            Gap(4.h),
                            Text(
                              'Earn 50 points for every new patient you refer to us.',
                              style: AppStyles.regular16(AppColors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
