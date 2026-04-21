import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/model/doctor_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/booking/read_book_screen.dart';
import 'package:sehat/src/ui/main/main_screen.dart';
import 'package:sehat/src/widget/button_widget.dart';
import 'package:sehat/src/widget/doctor_widget.dart';

import '../../../theme/app_icons.dart';

class BookDetailsScreen extends StatefulWidget {
  final bool isComplete;
  final DoctorModel doctorModel;

  const BookDetailsScreen({
    super.key,
    required this.isComplete,
    required this.doctorModel,
  });

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  TextEditingController controllerLatter = TextEditingController();
  int currentStar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          "View details",
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              DoctorWidget(
                doctorModel: widget.doctorModel,
                onTap: () {},
                isE: true,
                color: AppColors.white,
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
                      "Patient information",
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
                          SvgPicture.asset(AppIcons.user),
                          Gap(8.w),
                          Text(
                            "Patient ID",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "1233455",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(8.h),
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
                          SvgPicture.asset(AppIcons.call),
                          Gap(8.w),
                          Text(
                            "Call center",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "+998 91 234 56 78",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(8.h),
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
                            "Branch name",
                            style: AppStyles.regular16(AppColors.grey),
                          ),
                          Spacer(),
                          Text(
                            "Sehat clinic",
                            style: AppStyles.medium16(AppColors.card),
                          ),
                        ],
                      ),
                    ),
                    Gap(8.h),
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
                    Gap(8.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(AppImages.location),
                    ),
                    Gap(8.h),
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
              child: widget.isComplete
                  ? ButtonWidget(
                      buttonText: "Rate the doctor",
                      onTap: doctorRate,
                    )
                  : Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: cancel,
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.error,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.cancelCircle),
                                  Gap(8.w),
                                  Text(
                                    'Cancel',
                                    style: AppStyles.regular14(AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Gap(5.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              navigatorPush(context, ReadBookScreen());
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: AppColors.primaryBright,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(AppIcons.calendar1),
                                  Gap(8.w),
                                  Text(
                                    'Reschedule',
                                    style: AppStyles.regular14(AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }

  void doctorRate() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateBottom) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Evaluation for doctor',
                      style: AppStyles.medium24(AppColors.primaryDark),
                    ),
                    Gap(16.h),
                    Text(
                      'Your rating the doctor',
                      style: AppStyles.medium18(AppColors.black),
                    ),
                    Gap(10.h),
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (ctx, index) {
                          final starIndex = index + 1;
                          return GestureDetector(
                            onTap: () {
                              setStateBottom(() {
                                currentStar = starIndex;
                              });
                            },
                            child: Icon(
                              Icons.star,
                              size: 36.sm,
                              color: starIndex <= currentStar
                                  ? Colors.amber
                                  : AppColors.accentPink.withOpacity(0.1),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(16.h),
                    Text(
                      'Your opinion about the doctor',
                      style: AppStyles.medium18(AppColors.black),
                    ),
                    Gap(10.h),
                    TextField(
                      maxLines: 5,
                      controller: controllerLatter,
                      decoration: InputDecoration(
                        hintText: "Comment",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.border,
                            width: 0.1.w,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void cancel() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            width: 1.sw,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: const Color(0xffFFF0F1),
                  ),
                  padding: EdgeInsets.all(16.w),
                  child: SvgPicture.asset(AppIcons.alert),
                ),

                SizedBox(height: 12.h),

                Text(
                  "Are you sure you want to cancel the queue?",
                  textAlign: TextAlign.center,
                  style: AppStyles.regular18(AppColors.black),
                ),

                SizedBox(height: 20.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: const Color(0xffF1F5F9),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'No',
                            style: AppStyles.regular18(AppColors.primaryDark),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          navigatorPushAndRemoveUntil(
                            context,
                            MainScreen(currentIndex: 2),
                          );
                        },
                        child: Container(
                          height: 50.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.96),
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          child: Text(
                            'Yes',
                            style: AppStyles.regular18(AppColors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
