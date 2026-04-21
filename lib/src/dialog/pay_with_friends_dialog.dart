import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/navigators.dart';

import '../theme/app_styles.dart';

class PayWithFriendsDialog {
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
      height: 565.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.h),
        ),
      ),
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Pay with ',
                  style: AppStyles.bold24(AppColors.primaryDark),
                ),
                TextSpan(
                  text: 'Loyalty balance',
                  style: AppStyles.bold24(AppColors.accentPink),
                ),
              ],
            ),
          ),
          Gap(25.h),
          Center(
            child: Container(
              width: 240.w,
              height: 240.h,
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: AppColors.white,
                border: Border.all(color: AppColors.border),
              ),
              child: Image.asset(AppImages.qr, fit: BoxFit.cover),
            ),
          ),
          Gap(24.h),
          Text(
            'Scan this code with the clinic’s QR scanner to pay using your loyalty balance',
            style: AppStyles.regular16(AppColors.grey),
            textAlign: TextAlign.center,
          ),
          Gap(24.h),
          GestureDetector(
            onTap: (){
              navigatorPop(context);
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              duration: const Duration(milliseconds: 300),
              width: 1.sw,
              height: 54.h,
              decoration: BoxDecoration(
                color: Color(0xffF1F5F9),
                borderRadius: BorderRadius.circular(100.r),
              ),
              alignment: Alignment.center,
              child: Text(
                'Cancel',
                style: AppStyles.medium18(AppColors.primaryDark),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
