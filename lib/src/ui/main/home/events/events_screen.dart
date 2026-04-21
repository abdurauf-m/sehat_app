import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/home/events/event_details_screen.dart';

import '../../../../theme/app_icons.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text("Events", style: AppStyles.medium18(AppColors.primaryDark)),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = (constraints.maxWidth - 8) / 3;

                return Container(
                  height: 45.h,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.greySoft,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                        alignment: selectedIndex == 0
                            ? Alignment.centerLeft
                            : selectedIndex == 1
                            ? Alignment.center
                            : Alignment.centerRight,
                        child: Container(
                          width: itemWidth,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          _buildItem("Events", 0),
                          _buildItem("News", 1),
                          _buildItem("Blog", 2),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Gap(10.h),
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: [events(), events(), events()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget events() {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (ctx, index) {
        return GestureDetector(
          onTap: () {
            navigatorPush(context, EventDetailsScreen());
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 12.h),
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 180.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    child: Image.asset(AppImages.card, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppIcons.calendar,
                            color: AppColors.primaryLight,
                          ),
                          Gap(4.w),
                          Text(
                            'Feb 15, 2024',
                            style: AppStyles.regular14(AppColors.grey),
                          ),
                          Gap(16.w),
                          SvgPicture.asset(
                            AppIcons.location,
                            color: AppColors.primaryLight,
                          ),
                          Gap(4.w),
                          Text(
                            'Sehat clinic',
                            style: AppStyles.regular14(AppColors.grey),
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Text(
                        'Heart health matters',
                        style: AppStyles.medium18(AppColors.primaryDark),
                      ),
                      Gap(6.h),
                      Text(
                        'Understandin cardiovascular care prevention strategies..',
                        style: AppStyles.regular16(AppColors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItem(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedIndex = index);
        },
        child: Center(
          child: Text(
            text,
            style: AppStyles.bold16(
              selectedIndex == index ? AppColors.primary : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
