import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/widget/button_widget.dart';

class EventRegisterScreen extends StatefulWidget {
  const EventRegisterScreen({super.key});

  @override
  State<EventRegisterScreen> createState() => _EventRegisterScreenState();
}

class _EventRegisterScreenState extends State<EventRegisterScreen> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  late bool isFull;

  @override
  void initState() {
    super.initState();
    if (controllerName.text.isNotEmpty &&
        controllerPhone.text.isNotEmpty &&
        controllerPhone.text.length == 17) {
      isFull = true;
    } else {
      isFull = false;
    }
  }

  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          "Registration",
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.w),
              width: 1.sw,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Event',
                    style: AppStyles.medium12(.new(0xff13A4EC)),
                  ),
                  Gap(4.h),
                  Text(
                    'Advanced Cardiovascular Diagnostics',
                    style: AppStyles.medium18(AppColors.primaryDark),
                  ),
                ],
              ),
            ),
            Gap(10.h),
            Container(
              padding: EdgeInsets.all(20.w),
              width: 1.sw,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Participant Information',
                    style: AppStyles.medium14(AppColors.black),
                  ),
                  Gap(16.h),
                  Text(
                    "Full Name *",
                    style: AppStyles.medium12(AppColors.backgroundDark),
                  ),
                  Gap(8.h),
                  TextField(
                    controller: controllerName,
                    keyboardType: TextInputType.name,
                    style: AppStyles.medium14(AppColors.primaryDark),
                    decoration: InputDecoration(
                      hintText: "Ism kiriting",
                      hintStyle: AppStyles.regular16(
                        AppColors.grey.withOpacity(0.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: Color(0xffE2E8F0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  Gap(16.h),
                  Text(
                    "Phone number *",
                    style: AppStyles.medium12(AppColors.backgroundDark),
                  ),
                  Gap(8.h),
                  TextField(
                    controller: controllerPhone,
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.phone,
                    onChanged: (val) {
                      setState(() {
                        isFull = val.length == 17;
                      });
                    },
                    style: AppStyles.medium14(AppColors.primaryDark),
                    decoration: InputDecoration(
                      hintText: "+998 _ _  _ _ _  _ _  _ _",
                      hintStyle: AppStyles.regular16(
                        AppColors.grey.withOpacity(0.5),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 14.h,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(color: Color(0xffE2E8F0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (b) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: ButtonWidget(buttonText: 'Register', onTap: () {},isActive: isFull,),
          );
        },
      ),
    );
  }
}
