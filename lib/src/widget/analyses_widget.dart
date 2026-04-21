import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/model/analyses_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_styles.dart';

class AnalysesWidget extends StatelessWidget {
  final AnalysesModel analysesModel;
  final void Function() onTap;
  const AnalysesWidget({
    super.key,
    required this.analysesModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.w),
        padding: EdgeInsets.all(10.sp),
        width: 1.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: AppColors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 50.w,
              height: 50.h,
              child: Image.asset(analysesModel.image, fit: BoxFit.cover),
            ),
            Gap(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  analysesModel.name,
                  style: AppStyles.medium16(AppColors.black),
                ),
                Text(
                  analysesModel.person,
                  style: AppStyles.medium14(AppColors.black),
                ),
                Text(
                  analysesModel.time,
                  style: AppStyles.medium14(AppColors.grey),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xffF1F5F9),
              ),
              padding: EdgeInsets.all(10.sp),
              child: SvgPicture.asset(AppIcons.download),
            ),
          ],
        ),
      ),
    );
  }
}
