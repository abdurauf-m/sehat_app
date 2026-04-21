import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/model/doctor_model.dart';
import 'package:sehat/src/model/patients_model.dart';
import 'package:sehat/src/model/services_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/services/doctor_details_screen.dart';
import 'package:sehat/src/ui/main/services/ecuipment_details_screen.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/src/widget/doctor_widget.dart';
import 'package:sehat/src/widget/patients_widget.dart';
import 'package:sehat/src/widget/services_widget.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final ServicesModel servicesModel;

  const ServiceDetailsScreen({super.key, required this.servicesModel});

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<DoctorModel> doctorModel = [
      DoctorModel(
        image: AppImages.pediatrician,
        role: "Pediatrician",
        name: "Dr. Elena Voss",
      ),
      DoctorModel(
        image: AppImages.orthopedicSurgeon,
        role: "Orthopedic Surgeon",
        name: "Dr. Marcus Lyle",
      ),
      DoctorModel(
        image: AppImages.cardiologist,
        role: "Cardiologist",
        name: "Dr. Fiona Hargrove",
      ),
      DoctorModel(
        image: AppImages.neurologist,
        role: "Neurologist",
        name: "Dr. Samuel Treadwell",
      ),
      DoctorModel(
        image: AppImages.dermatologist,
        role: "Dermatologist",
        name: "Dr. Clara Winslow",
      ),
    ];

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
    bool index = patientsModel.indexed == 1 ? true : false;
    final service = widget.servicesModel;
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(service.name, style: AppStyles.medium18(AppColors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Column(
            children: [
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
                      "Stamatology",
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
                        "The Stomatology Service delivers comprehensive, patient-centered dental care through a coordinated, multidisciplinary team approach. We offer advanced and integrated treatment options for a wide range of oral, dental, and maxillofacial conditions.",
                        style: AppStyles.regular14(AppColors.black),
                      ),
                    ),
                  ],
                ),
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
                      "Meet our doctors",
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(12.h),
                    SizedBox(
                      height: 90 * doctorModel.length + 30.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: doctorModel.length,
                        itemBuilder: (ctx, index) {
                          return DoctorWidget(
                            doctorModel: doctorModel[index],
                            onTap: () {
                              navigatorPush(
                                context,
                                DoctorDetailsScreen(
                                  doctorModel: doctorModel[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
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
                      "Diagnostics",
                      style: AppStyles.medium16(AppColors.black),
                    ),
                    Gap(10.h),
                    SizedBox(
                      height: 110.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ServicesWidget(
                              color: Color(0xffF2F2F2),
                              servicesModel: ServicesModel(
                                name: "X-ray",
                                image: AppImages.xRay,
                              ),
                              onTap: () {
                                navigatorPush(
                                  context,
                                  EcuipmentDetailsScreen(
                                    servicesModel: ServicesModel(
                                      name: "X-ray",
                                      image: AppImages.xRay,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Gap(10.w),
                          Expanded(
                            child: ServicesWidget(
                              servicesModel: ServicesModel(
                                name: "Mskt",
                                image: AppImages.xRay,
                              ),
                              onTap: () {
                                navigatorPush(
                                  context,
                                  EcuipmentDetailsScreen(
                                    servicesModel: ServicesModel(
                                      name: "Mskt",
                                      image: AppImages.xRay,
                                    ),
                                  ),
                                );
                              },
                              color: Color(0xFFF2F2F2),
                            ),
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
                      height: index ? 170.h : 190.h,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: patientsModel.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
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
                            style: AppStyles.regular14(AppColors.grey),
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
                                  style: AppStyles.regular14(AppColors.grey),
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
                              style: AppStyles.regular14(AppColors.grey),
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
      bottomSheet: BottomSheet(
        backgroundColor: AppColors.white,
        onClosing: () {},
        builder: (ctx) {
          return Padding(
            padding: EdgeInsets.only(bottom: 40.h, left: 16.w, right: 16.w),
            child: ButtonWidget(buttonText: "Schedule checkup", onTap: () {}),
          );
        },
      ),
    );
  }
}
