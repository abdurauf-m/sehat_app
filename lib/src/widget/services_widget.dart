import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/model/services_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';

class ServicesWidget extends StatelessWidget {
  final ServicesModel servicesModel;
  final void Function() onTap;
  final Color color;

  const ServicesWidget({
    super.key,
    required this.servicesModel,
    required this.onTap,
    this.color = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              servicesModel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppStyles.medium16(AppColors.black),
            ),
            Gap(20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 48.r,
                  height: 48.r,
                  child: Image.asset(servicesModel.image, fit: BoxFit.cover),
                ),
                SvgPicture.asset("assets/icons/arrow-right.svg", width: 24.r),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
