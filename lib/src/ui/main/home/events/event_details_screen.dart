import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/home/events/event_register_screen.dart';
import 'package:sehat/src/widget/button_widget.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 233.h,
                  child: Image.asset(AppImages.card, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 24,
                  child: GestureDetector(
                    onTap: () {
                      navigatorPop(context);
                    },
                    child: Icon(size: 40.h, Icons.chevron_left_outlined),
                  ),
                ),
                Positioned(
                  bottom: -520.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 20.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Advanced Cardiovascular Diagnostics Workshop',
                          style: AppStyles.medium24(AppColors.primaryDark),
                        ),
                        Gap(20.h),
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.primaryLight.withOpacity(0.1),
                              ),
                              child: SvgPicture.asset(
                                AppIcons.calendarFavorite,
                              ),
                            ),
                            Gap(16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tuesday, Oct 24, 2026',
                                  style: AppStyles.medium14(
                                    AppColors.primaryDark,
                                  ),
                                ),
                                Text(
                                  '09:00 AM - 04:30 PM',
                                  style: AppStyles.regular12(AppColors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(16.h),
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: AppColors.primaryLight.withOpacity(0.1),
                              ),
                              child: SvgPicture.asset(
                                AppIcons.location,
                                color: Color(0xff13A4EC),
                              ),
                            ),
                            Gap(16.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sehat Medical Center',
                                  style: AppStyles.medium14(
                                    AppColors.primaryDark,
                                  ),
                                ),
                                Text(
                                  'Sehat Clinic, 4th Floor',
                                  style: AppStyles.regular12(AppColors.grey),
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              'View Map',
                              style: AppStyles.semiBold12(Color(0xff13A4EC)),
                            ),
                          ],
                        ),
                        Gap(20.h),
                        Text(
                          'KEYNOTE SPEAKER',
                          style: AppStyles.medium18(AppColors.black),
                        ),
                        Gap(12.h),
                        Container(
                          padding: EdgeInsets.all(10.w),
                          width: 1.sw,
                          height: 64.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: AppColors.white,
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 44.w,
                                height: 44.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100.r),
                                  child: Image.asset(
                                    AppImages.person,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Gap(8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dr. Noah Thomson',
                                    style: AppStyles.medium14(
                                      AppColors.primaryDark,
                                    ),
                                  ),
                                  Text(
                                    'Dentist',
                                    style: AppStyles.regular12(AppColors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.border),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '4.6',
                                      style: AppStyles.regular12(
                                        AppColors.primaryDark,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppColors.accentOrange,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(20.h),
                        Text(
                          'ABOUT THIS EVENT',
                          style: AppStyles.medium18(AppColors.black),
                        ),
                        Gap(12.h),
                        Text(
                          'This full-day intensive workshop focuses on the latest advancements in non-invasive cardiovascular imaging and diagnostic techniques. Designed for clinical practitioners, we will cover 3D echocardiography, coronary CT angiography, and MRI clinical correlations.',
                          style: AppStyles.regular14(AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(100.h),
          ],
        ),
      ),
      bottomSheet: SafeArea(
        child: BottomSheet(
          backgroundColor: AppColors.white,
          onClosing: () {},
          builder: (ctx) {
            return Padding(
              padding: EdgeInsets.only(bottom: 40.h, ),
              child: ButtonWidget(
                buttonText: "Book now",
                onTap: () {
                  navigatorPush(context, EventRegisterScreen());
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
