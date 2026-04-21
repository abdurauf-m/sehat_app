import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';

class AnalysesDetailsScreen extends StatefulWidget {
  final String name;

  const AnalysesDetailsScreen({super.key, required this.name});

  @override
  State<AnalysesDetailsScreen> createState() => _AnalysesDetailsScreenState();
}

class _AnalysesDetailsScreenState extends State<AnalysesDetailsScreen> {
  List<bool> selectedList = List.generate(10, (index) => false);
  int sum = 540;
  late int leng;

  @override
  void initState() {
    super.initState();
    leng = selectedList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          "${widget.name} analyses",
          style: AppStyles.medium18(AppColors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(
          bottom: selectedList.contains(true) ? 130.h : 90.h,
        ),
        itemCount: 10,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedList[index] = !selectedList[index];
              });
            },
            child: Container(
              padding: EdgeInsets.all(12.sp),
              width: 1.sw,
              height: 74.h,
              margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 70.w,
                    height: 50.h,
                    child: Image.asset(AppImages.monitor, fit: BoxFit.cover),
                  ),
                  Gap(10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('X-Ray', style: AppStyles.medium16(AppColors.black)),
                      Text(
                        '$sum 000 UZS',
                        style: AppStyles.medium16(AppColors.grey),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 20.w,
                    height: 20.h,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: selectedList[index] ? Colors.blue : Colors.grey,
                        width: 2.w,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedList[index]
                            ? Colors.blue
                            : Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (ctx) {
          int selectedCount = selectedList.where((e) => e).length;
          int totalSum = sum * selectedCount;
          bool isActive = totalSum == 0 ? false : true;
          return Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.sp),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ?selectedList.contains(true)
                    ? Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          '$totalSum 000 UZS',
                          style: AppStyles.regular18(AppColors.grey),
                        ),
                      )
                    : null,
                ?selectedList.contains(true) ? Gap(10.h) : null,
                ButtonWidget(
                  isActive: isActive,
                  buttonText: 'Booking',
                  onTap: () {},
                ),
                Gap(10.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
