import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/model/patients_model.dart';
import 'package:sehat/src/model/services_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/src/widget/patients_widget.dart';

class EcuipmentDetailsScreen extends StatelessWidget {
  final ServicesModel servicesModel;

  const EcuipmentDetailsScreen({super.key, required this.servicesModel});

  @override
  Widget build(BuildContext context) {
    List<PatientsModel> patientsModel = [
      PatientsModel(
        image: AppIcons.technology,
        name: '''Advanced technology''',
        title: '''Precision and safety''',
      ),
      PatientsModel(
        image: AppIcons.person,
        name: '''Personalized care''',
        title: '''Plans for your condition''',
      ),
      PatientsModel(
        image: AppIcons.favorite,
        name: '''Minimal discomfort''',
        title: '''Comfort-first methods''',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          servicesModel.name,
          style: AppStyles.regular16(AppColors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1.sw,
                height: 197.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(AppImages.room, fit: BoxFit.cover),
                ),
              ),
              Gap(10.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.only(
                  top: 16.h,
                  right: 12.w,
                  bottom: 12.h,
                  left: 12.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "X-ray informations",
                      style: AppStyles.medium16(AppColors.black),
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
                      child: Text(
                        "X-ray is a fast and painless diagnostic imaging procedure that uses low-dose radiation to create images of the inside of the regular12. It is commonly used to examine bones, chest, joints, and certain internal organs.",
                        style: AppStyles.regular14(AppColors.grey),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Working time",
                            style: AppStyles.regular16(AppColors.black),
                          ),
                          Text(
                            "From Monday to Saturday from 08:30 to 17:00",
                            style: AppStyles.regular14(AppColors.grey),
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
                padding: EdgeInsets.only(
                  top: 16.h,
                  right: 12.w,
                  bottom: 12.h,
                  left: 12.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Why patients choose us?",
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(12.h),
                    SizedBox(
                      height: 201.h,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: patientsModel.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: PatientsWidget(
                              patientsModel: patientsModel[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.only(
                  top: 16.h,
                  right: 12.w,
                  bottom: 12.h,
                  left: 12.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Treatment gallery",
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(12.h),
                    Row(
                      children: [
                        Container(
                          width: 154.5.w,
                          height: 154.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppImages.first,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Gap(10.w),
                        Container(
                          width: 154.5.w,
                          height: 154.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppImages.second,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(AppImages.third),
                    ),
                    Gap(10.h),
                    Row(
                      children: [
                        Container(
                          width: 154.5.w,
                          height: 154.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppImages.fourth,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Gap(10.w),
                        Container(
                          width: 154.5.w,
                          height: 154.5.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.asset(
                              AppImages.fifth,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(10.h),
              Container(
                width: 1.sw,
                padding: EdgeInsets.only(
                  top: 16.h,
                  right: 12.w,
                  bottom: 12.h,
                  left: 12.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(12.h),
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
                            style: AppStyles.regular12(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "Sehat clinic",
                            style: AppStyles.regular16(AppColors.black),
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
                                  style: AppStyles.regular12(AppColors.grey),
                                ),
                                Text(
                                  "Amir Temur Square, Toshkent, Uzbekistan",
                                  style: AppStyles.regular16(AppColors.black),
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
                              style: AppStyles.regular12(AppColors.grey),
                            ),
                          ),
                          Gap(8.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(100.h),
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
