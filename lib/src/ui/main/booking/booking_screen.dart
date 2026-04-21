import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/model/doctor_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/booking/book_details_screen.dart';
import 'package:sehat/src/ui/main/booking/read_book_screen.dart';
import 'package:sehat/src/widget/booking_widget.dart';

import '../../../theme/app_images.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BookingWidget> book = [
      BookingWidget(
        isHistory: true,
        status: 'Complete',
        onTap: () {
          navigatorPush(
            context,
            BookDetailsScreen(
              isComplete: true,
              doctorModel: DoctorModel(
                image: AppImages.person,
                name: '"Dr. Noah Thomson"',
                role: 'Dentist',
              ),
            ),
          );
        },
      ),
      BookingWidget(
        isHistory: true,
        status: 'Canceled',
        onTap: () {
          navigatorPush(context, ReadBookScreen());
        },
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text("My bookings", style: AppStyles.medium18(AppColors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
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
                              "Upcoming",
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
                              "History",
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

            SizedBox(height: 20),

            Expanded(
              child: IndexedStack(
                index: selectedIndex,
                children: [upcoming(), history(book)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget upcoming() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (ctx, index) {
        return BookingWidget(
          isHistory: false,
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
        );
      },
    );
  }

  Widget history(List<Widget> book) {
    return ListView.builder(
      itemCount: book.length,
      itemBuilder: (ctx, index) {
        return book[index];
      },
    );
  }
}
