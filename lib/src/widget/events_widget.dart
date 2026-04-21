import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';

import '../theme/app_icons.dart';
import '../theme/app_styles.dart';

class EventsWidget extends StatelessWidget {
  final void Function() onTap;
  const EventsWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        width: 200.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1.sw,
              height: 133.22369384765625.h,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: Image.asset(AppImages.card, fit: BoxFit.cover),
              ),
            ),
            Gap(12.h),
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.calendar),
                      Gap(6.w),
                      Text(
                        "Feb 15, 2024",
                        style: AppStyles.regular12(AppColors.black),
                      ),
                    ],
                  ),
                  Gap(10.h),
                  Text(
                    "Heart health matters",
                    style: AppStyles.medium16(AppColors.black),
                  ),
                  Gap(6.h),
                  Text(
                    "Understandin cardiovascular care prevention strategies..",
                    style: AppStyles.regular14(AppColors.grey),
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
