import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';

class BookingWidget extends StatelessWidget {
  final bool isHistory;
  final String status;
  final void Function() onTap;
  const BookingWidget({
    super.key,
    required this.isHistory,
    this.status = '',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        width: 1.sw,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.r),
                    child: Image.asset(AppImages.person, fit: BoxFit.cover),
                  ),
                ),
                Gap(8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Noah Thomson",
                      style: AppStyles.medium16(AppColors.primaryDark),
                    ),
                    Text(
                      "Dentist",
                      style: AppStyles.medium14(Color(0xff68778D)),
                    ),
                  ],
                ),
                isHistory == true ? Spacer() : SizedBox(),
                isHistory == true
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: status == 'Complete'
                              ? AppColors.success.withOpacity(0.3)
                              : AppColors.error.withOpacity(0.3),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          status,
                          style: AppStyles.regular12(
                            status == 'Complete'
                                ? AppColors.success
                                : AppColors.error,
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            ),
            Gap(20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              width: 1.sw,
              height: 44.h,
              decoration: BoxDecoration(
                color: Color(0xFFFAFAFA),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.w),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.calendar),
                  Gap(4.w),
                  Text("Feb.15", style: AppStyles.medium12(AppColors.card)),
                  Gap(18.w),
                  SvgPicture.asset(AppIcons.clock),
                  Gap(4.w),
                  Text("15:30", style: AppStyles.medium12(AppColors.card)),
                  Spacer(),
                  Container(
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 4.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.file,
                          color: AppColors.primary,
                        ),
                        Gap(2.w),
                        Text(
                          "View details",
                          style: AppStyles.medium12(AppColors.primary),
                        ),
                      ],
                    ),
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
