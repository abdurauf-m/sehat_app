import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/model/doctor_model.dart';
import 'package:sehat/src/theme/app_colors.dart';

import '../theme/app_styles.dart';

class DoctorWidget extends StatelessWidget {
  final DoctorModel doctorModel;
  final void Function() onTap;
  final Color color;
  final bool isE;
  const DoctorWidget({
    super.key,
    this.isE = false,
    required this.doctorModel,
    required this.onTap,
    this.color = AppColors.surfaceLight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        padding: EdgeInsets.all(10.sp),
        width: 1.sw,
        height: 84.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: color,
        ),
        child: Row(
          children: [
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.asset(doctorModel.image, fit: BoxFit.cover),
              ),
            ),
            Gap(8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name,
                  style: AppStyles.medium16(AppColors.black),
                ),
                Gap(10.h),
                isE == false
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          color: Color(0xff001E62).withOpacity(0.2),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          doctorModel.role,
                          style: AppStyles.regular12(AppColors.primary),
                        ),
                      )
                    : Text(
                        doctorModel.role,
                        style: AppStyles.regular12(AppColors.primary),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
