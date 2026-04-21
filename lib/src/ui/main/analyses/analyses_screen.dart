import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/model/analyses_model.dart';
import 'package:sehat/src/model/services_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/analyses/analyses_details_screen.dart';
import 'package:sehat/src/widget/analyses_widget.dart';
import 'package:sehat/src/widget/services_widget.dart';

class AnalysesScreen extends StatefulWidget {
  const AnalysesScreen({super.key});

  @override
  State<AnalysesScreen> createState() => _AnalysesScreenState();
}

class _AnalysesScreenState extends State<AnalysesScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          "Analyses",
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                        : Alignment.centerRight,
                    child: Container(
                      width: (1.sw - 28) / 2,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() => selectedIndex = 0);
                          },
                          child: Center(
                            child: Text(
                              "Analyses history",
                              style: AppStyles.bold16(
                                selectedIndex == 0
                                    ? AppColors.primary
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() => selectedIndex = 1);
                          },
                          child: Center(
                            child: Text(
                              "Available analyses",
                              style: AppStyles.bold16(
                                selectedIndex == 1
                                    ? AppColors.primary
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10.h),
            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: [history(), analyses()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget history() {
    List<String> text = [
      'Cardiology',
      'Laboratory',
      'Heart rate',
      'Blood pressure',
    ];
    List<AnalysesModel> analyses = [
      AnalysesModel(
        name: 'Cardiology',
        image: AppImages.heart,
        person: 'Dr. Emily Carter',
        time: 'Feb 14, 2026',
      ),
      AnalysesModel(
        name: 'Stamatology',
        image: AppImages.heart,
        person: 'Dr. Lucas Bennett',
        time: 'Feb 14, 2026',
      ),
    ];
    List<AnalysesModel> analyses2 = [
      AnalysesModel(
        name: 'Neurology',
        image: AppImages.heart,
        person: 'Dr. Ava Mitchell',
        time: 'Feb 14, 2026',
      ),
      AnalysesModel(
        name: 'Ophthalmology',
        image: AppImages.heart,
        person: 'Dr. Ethan Parker',
        time: 'Feb 14, 2026',
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppIcons.search,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                hintText: 'Search your file ...',
                border: InputBorder.none,
              ),
            ),
          ),
          Gap(10.h),
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: text.length,
              itemBuilder: (ctx, index) {
                return Container(
                  margin: EdgeInsets.only(right: 6.w),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 37.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: AppColors.white,
                  ),
                  child: Text(
                    text[index],
                    style: AppStyles.regular14(AppColors.black),
                  ),
                );
              },
            ),
          ),
          Gap(16.h),
          Text("The last analyzes", style: AppStyles.medium18(AppColors.black)),
          Gap(12.h),
          SizedBox(
            height: 95 * analyses.length + 0,
            child: ListView.builder(
              itemCount: analyses.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return AnalysesWidget(
                  analysesModel: analyses[index],
                  onTap: () {
                    navigatorPush(
                      context,
                      AnalysesDetailsScreen(name: analyses[index].name),
                    );
                  },
                );
              },
            ),
          ),
          Gap(5.h),
          Text(
            "2024 year analyzes",
            style: AppStyles.medium18(AppColors.black),
          ),
          Gap(12.h),
          SizedBox(
            height: 95 * analyses2.length + 0,
            child: ListView.builder(
              itemCount: analyses2.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return AnalysesWidget(
                  analysesModel: analyses2[index],
                  onTap: () {
                    navigatorPush(
                      context,
                      AnalysesDetailsScreen(name: analyses2[index].name),
                    );
                  },
                );
              },
            ),
          ),
          Gap(80.h),
        ],
      ),
    );
  }

  Widget analyses() {
    List<ServicesModel> servicesModel = [
      ServicesModel(name: "Cardiology", image: AppImages.heart),
      ServicesModel(name: "Stamatology", image: AppImages.heart),
      ServicesModel(name: "Neurology", image: AppImages.heart),
      ServicesModel(name: "Ophthalmology", image: AppImages.heart),
      ServicesModel(name: "Laboratory", image: AppImages.heart),
      ServicesModel(name: "Dermatology", image: AppImages.heart),
      ServicesModel(name: "Otolaryngology", image: AppImages.heart),
      ServicesModel(name: "Orthopedics", image: AppImages.heart),
      ServicesModel(name: "Endocrinology", image: AppImages.heart),
      ServicesModel(name: "Pulmonology", image: AppImages.heart),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 1.sw,
            height: 44.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              color: AppColors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    AppIcons.search,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          Gap(10.h),
          SizedBox(
            height: 850.h,
            child: GridView.builder(
              itemCount: servicesModel.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                mainAxisExtent: 115.h,
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              itemBuilder: (ctx, index) {
                return ServicesWidget(
                  servicesModel: servicesModel[index],
                  onTap: () {
                    navigatorPush(
                      context,
                      AnalysesDetailsScreen(name: servicesModel[index].name),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
