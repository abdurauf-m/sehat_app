import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/model/doctor_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/src/widget/doctor_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctorModel;

  const DoctorDetailsScreen({super.key, required this.doctorModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          doctorModel.name,
          style: AppStyles.medium18(AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DoctorWidget(
                doctorModel: doctorModel,
                onTap: () {},
                color: AppColors.white,
              ),
              Gap(10.h),
              Container(
                padding: EdgeInsets.only(
                  top: 16.h,
                  right: 12.w,
                  bottom: 12.h,
                  left: 12.w,
                ),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Doctor information",
                      style: AppStyles.medium20(AppColors.black),
                    ),
                    Gap(12.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.briefcase),
                          Gap(8.w),
                          Text(
                            "Department",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "Stamatology",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.translation),
                          Gap(8.w),
                          Text(
                            "Language spoken",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "Uzbek , English",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.briefcase),
                          Gap(8.w),
                          Text(
                            "Work experience",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "5 year",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.userMultiple),
                          Gap(8.w),
                          Text(
                            "Number of patients treated",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "100",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.user),
                          Gap(8.w),
                          Text(
                            "More about the doctor",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          RotatedBox(
                            quarterTurns: 45,
                            child: Icon(Icons.chevron_right_outlined),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppIcons.timeManagementCircle),
                          Gap(8.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Working time",
                                  style: AppStyles.regular16(AppColors.grey),
                                ),
                                Text(
                                  "From Monday to Saturday from 08:30 to 17:00",
                                  style: AppStyles.medium16(AppColors.card),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(AppImages.location),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.hospital),
                          Gap(8.w),
                          Text(
                            "Name of the hospital",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "Sehat clinic",
                            style: AppStyles.medium16(AppColors.black),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(AppIcons.location),
                          Gap(8.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: AppStyles.regular16(AppColors.grey),
                                ),
                                Text(
                                  "Amir Temur Square, Toshkent, Uzbekistan",
                                  style: AppStyles.medium16(AppColors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(10.h),
                    Container(
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: .new(0xff0A000000),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              topLeft: Radius.circular(8.r),
                            ),
                            child: Image.asset(AppImages.map),
                          ),
                          Gap(12.h),
                          Center(
                            child: Text(
                              "Mirzo Ulugbek Durmon Street 20-A",
                              style: AppStyles.regular16(AppColors.grey),
                            ),
                          ),
                          Gap(8.h),
                        ],
                      ),
                    ),
                    Gap(100.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: SafeArea(
        child: BottomSheet(
          backgroundColor: AppColors.white,
          onClosing: () {},
          builder: (ctx) {
            return Padding(
              padding: EdgeInsets.only(bottom: 40.h, left: 16.w, right: 16.w),
              child: ButtonWidget(buttonText: "Schedule checkup", onTap: () {}),
            );
          },
        ),
      ),
    );
  }
}
