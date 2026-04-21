import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/model/patients_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';

class PatientsWidget extends StatelessWidget {
  final PatientsModel patientsModel;

  const PatientsWidget({super.key, required this.patientsModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: Color(0xffEFF6FF),
            ),
            padding: EdgeInsets.all(14.sp),
            child: SvgPicture.asset(patientsModel.image),
          ),
          Gap(10.h),
          Text(
            patientsModel.name,
            style: AppStyles.medium14(Color(0xff0F172A)),
          ),
          Gap(4.h),
          Text(patientsModel.title, style: AppStyles.regular14(AppColors.grey)),
        ],
      ),
    );
  }
}
