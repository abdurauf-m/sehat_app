import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/dialog/layalty_balancy_dialog.dart';
import 'package:sehat/src/model/doctor_model.dart';
import 'package:sehat/src/model/story_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/booking/book_details_screen.dart';
import 'package:sehat/src/ui/main/home/events/event_details_screen.dart';
import 'package:sehat/src/ui/main/home/events/events_screen.dart';
import 'package:sehat/src/ui/main/home/notifications_screen.dart';
import 'package:sehat/src/ui/main/home/story/story_screen.dart';
import 'package:sehat/src/widget/events_widget.dart';
import 'package:sehat/src/widget/story_widget.dart';

class HomeScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const HomeScreen({super.key, required this.scaffoldKey});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controllerSearch = TextEditingController();
  List<StoryModel> story = [
    StoryModel(image: AppImages.story1),
    StoryModel(image: AppImages.story2),
    StoryModel(image: AppImages.story3),
    StoryModel(image: AppImages.story4),
    StoryModel(image: AppImages.story5),
  ];

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.landscape) {
       if (kDebugMode) {
         print("Telefon yonbosh holatda");
       }
    } else {
      if (kDebugMode) {
        print("Telefon tik holatda");
      }
    }
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: appBar(),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child:SingleChildScrollView(
          child:Column(
            children: [
              Gap(14.h),
              SizedBox(
                height: 65.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: story.length,
                  itemBuilder: (ctx, index) {
                    return StoryWidget(
                      storyModel: story[index],
                      onTap: () {
                        navigatorPush(context, StoryScreen());
                      },
                    );
                  },
                ),
              ),
              Gap(14.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigatorPush(
                          context,
                          BookDetailsScreen(
                            isComplete: false,
                            doctorModel: DoctorModel(
                              image: AppImages.person,
                              name: '"Dr. Noah Thomson"',
                              role: 'Dentist',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(12.sp),
                        width:  double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: AppColors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Scheduled doctor's appointment",
                              style: AppStyles.medium20(AppColors.accentPink),
                            ),
                            Gap(16.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 44.w,
                                  height: 44.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.r),
                                    child: Image.asset(
                                      AppImages.person,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(9.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr. Noah Thomson",
                                      style: AppStyles.medium16(
                                        AppColors.primary,
                                      ),
                                    ),
                                    Gap(4.h),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6.r),
                                        color: AppColors.primaryLight.withOpacity(
                                          0.2,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Dentist",
                                        style: AppStyles.regular12(
                                          AppColors.primary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Gap(10.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              width:  double.infinity,
                              height: 44.h,
                              decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(12.w),
                                ),
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(AppIcons.calendar),
                                  Gap(4.w),
                                  Text(
                                    "Feb.15",
                                    style: AppStyles.medium12(AppColors.card),
                                  ),
                                  Gap(18.w),
                                  SvgPicture.asset(AppIcons.clock),
                                  Gap(4.w),
                                  Text(
                                    "15:30",
                                    style: AppStyles.medium12(AppColors.card),
                                  ),
                                  Spacer(),
                                  Container(
                                    height: 28.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(6.r),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 6.w,
                                      vertical: 4.h,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(AppIcons.file),
                                        Gap(2.w),
                                        Text(
                                          "View details",
                                          style: AppStyles.medium12(
                                            AppColors.card,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(color: AppColors.white.withOpacity(0.2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Events",
                          style: AppStyles.medium16(AppColors.primaryDark),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigatorPush(context, EventsScreen());
                          },
                          child: Text(
                            "All",
                            style: AppStyles.medium14(AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                  ],
                ),
              ),
              SizedBox(
                height: 295.h,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return EventsWidget(
                      onTap: () {
                        navigatorPush(context, EventDetailsScreen());
                      },
                    );
                  },
                ),
              ),
              Gap(100.h),
            ],
          ),
        )
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              widget.scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(AppImages.person2, fit: BoxFit.cover),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              LayaltyBalancyDialog.show(context);
            },
            child: Container(
              padding: EdgeInsets.all(5.r),
              width: 95.w,
              height: 36.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppIcons.gift),
                  Gap(4.w),
                  Text("20.000", style: AppStyles.medium14(AppColors.white)),
                ],
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              navigatorPush(context, NotificationsScreen());
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              width: 40.r,
              height: 40.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.white.withOpacity(0.1),
              ),
              child: SvgPicture.asset(AppIcons.notification),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32.r)),
      ),
      backgroundColor: AppColors.primary,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(64.h),
        child: Container(
          margin: EdgeInsets.only(bottom: 12.h, left: 16.w, right: 16.w),
          width:  double.infinity,
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search for service or doctors...",
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: EdgeInsets.all(8.r),
                child: SvgPicture.asset(AppIcons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
