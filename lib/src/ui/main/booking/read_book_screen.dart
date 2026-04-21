import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';

class ReadBookScreen extends StatefulWidget {
  const ReadBookScreen({super.key});

  @override
  State<ReadBookScreen> createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  DateTime startDate = DateTime.now();
  int selectedIndex = 0;
  List<String> times = [
    "09:30 AM",
    "11:30 AM",
    "12:30 AM",
    "09:30 AM",
    "11:30 PM",
    "03:30 AM",
    "01:30 PM",
    "03:30 AM",
    "04:30 AM",
  ];
  String monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[month - 1];
  }

  DateTime selectedDate = DateTime.now();
  String time = '';
  int selectedTime = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          'Booking doctor',
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 44.w,
                      height: 44.h,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100.r),
                        child: Image.asset(AppImages.person, fit: BoxFit.cover),
                      ),
                    ),
                    Gap(9.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Noah Thomson",
                          style: AppStyles.medium16(AppColors.primaryDark),
                        ),
                        Gap(4.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: AppColors.primaryLight.withOpacity(0.2),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Dentist",
                            style: AppStyles.regular12(AppColors.primaryDark),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(5.h),
              Container(
                padding: EdgeInsets.all(16.w),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: AppStyles.medium16(AppColors.primaryDark),
                    ),
                    Gap(8.h),
                    Container(
                      padding: EdgeInsets.all(10.w),
                      width: 1.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.black.withOpacity(0.1),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.location),
                          Gap(4.w),
                          Text(
                            'Amir Temur Square, Toshkent, Uzbekistan',
                            style: AppStyles.medium12(AppColors.primaryDark),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Gap(5.h),
              Container(
                padding: EdgeInsets.all(16.w),
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Select date",
                          style: AppStyles.medium16(AppColors.primaryDark),
                        ),
                        GestureDetector(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2050),

                              builder: (context, child) {
                                return Theme(
                                  data: ThemeData.light().copyWith(
                                    scaffoldBackgroundColor: Colors.white,
                                    dialogBackgroundColor: Colors.white,

                                    colorScheme: ColorScheme.light(
                                      primary: AppColors.primary,
                                      onPrimary: Colors.white,
                                      surface: Colors.white,
                                      onSurface: Colors.black,
                                    ),

                                    datePickerTheme: DatePickerThemeData(
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
                            );

                            if (picked != null) {
                              setState(() {
                                selectedDate = picked;
                                startDate = picked;
                                selectedIndex = 0;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                "${monthName(selectedDate.month)} ${selectedDate.year}",
                                style: AppStyles.regular16(
                                  AppColors.primaryDark,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    SizedBox(
                      height: 70.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          DateTime date = startDate.add(Duration(days: index));

                          bool isSelected = index == selectedIndex;
                          String getWeekday(int weekday) {
                            const days = [
                              "Mon",
                              "Tue",
                              "Wed",
                              "Thu",
                              "Fri",
                              "Sat",
                              "Sun",
                            ];
                            return days[weekday - 1];
                          }

                          String dayName = getWeekday(date.weekday);

                          String dayNumber = date.day.toString();
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                selectedDate = date;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12.w),
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              width: 60.w,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primary
                                    : Colors.white,
                                border: isSelected
                                    ? null
                                    : Border.all(color: AppColors.border),
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dayName,
                                    style: AppStyles.regular12(
                                      isSelected
                                          ? Colors.white
                                          : AppColors.overlayDark,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    dayNumber,
                                    style: AppStyles.semiBold16(
                                      isSelected
                                          ? Colors.white
                                          : AppColors.overlayDark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Gap(5.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Queues",
                      style: AppStyles.medium16(AppColors.primaryDark),
                    ),
                    SizedBox(height: 16.h),

                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: times.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 2.5,
                      ),
                      itemBuilder: (context, index) {
                        bool isSelected = selectedTime == index;
                        return GestureDetector(
                          onTap: index == 1
                              ? null
                              : () {
                                  setState(() {
                                    selectedTime = index;
                                  });

                                  time = times[index];
                                  print("Selected: ${times[index]}");
                                },
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: index == 1
                                  ? .new(0xffF1F5F9)
                                  : isSelected
                                  ? AppColors.primary
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: index == 1
                                  ? null
                                  : isSelected
                                  ? null
                                  : Border.all(color: Colors.grey.shade300),
                            ),
                            child: Text(
                              times[index],
                              style: AppStyles.medium14Scale(
                                isSelected == false
                                    ? AppColors.primaryDark
                                    : AppColors.white,
                                index == 1 ? TextDecoration.lineThrough : null,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              selectedTime != -1 ? Gap(44.h) : Gap(74.h),
            ],
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        backgroundColor: AppColors.white,
        onClosing: () {},
        builder: (ctx) {
          bool isActive = selectedTime != -1;
          String tim = isActive
              ? "${selectedDate.day}.${selectedDate.month}.${selectedDate.year}  ${times[selectedTime]}"
              : "";
          return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isActive)
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      tim,
                      style: AppStyles.regular16(AppColors.grey),
                    ),
                  ),
                if (isActive) Gap(10.h),
                ButtonWidget(
                  isActive: isActive,
                  buttonText: 'Schedule checkup',
                  onTap: () {},
                ),
                Gap(30.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
