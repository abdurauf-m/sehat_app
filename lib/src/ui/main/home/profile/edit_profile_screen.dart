import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/widget/button_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLastname = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  late bool isFull;
  var maskFormatter = MaskTextInputFormatter(
    mask: '+998 ## ### ## ##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  @override
  void initState() {
    super.initState();
    if(controllerLastname.text.isNotEmpty&&controllerLastname.text.isNotEmpty&&controllerPhone.text.isNotEmpty&& controllerPhone.text.length == 17)
    {
      isFull= true;
    }else{
      isFull = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration(String hint) => InputDecoration(
      hintText: hint,
      hintStyle: AppStyles.regular16(AppColors.grey.withOpacity(0.5)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      filled: true,
      fillColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: const BorderSide(color: Color(0xffE2E8F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.r),
        borderSide: BorderSide(color: AppColors.primary, width: 1.5),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
    );

    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          'Edit profile',
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 96.w,
                    height: 96.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Image.asset(
                      AppImages.avatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppIcons.camera),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Text(
              'First name',
              style: AppStyles.regular16(AppColors.black),
            ),
            Gap(5.h),
            TextField(
              controller: controllerName,
              style: AppStyles.medium14(AppColors.primaryDark),
              decoration: inputDecoration("Pedro Duarte"),
            ),
            Gap(8.h),
            Text(
              'Last name',
              style: AppStyles.regular16(AppColors.black),
            ),
            Gap(5.h),
            TextField(
              controller: controllerLastname,
              style: AppStyles.medium14(AppColors.primaryDark),
              decoration: inputDecoration("Pedro Duarte"),
            ),
            Gap(8.h),
            Text(
              'Phone number',
              style: AppStyles.regular16(AppColors.black),
            ),
            Gap(5.h),
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
      bottomSheet: BottomSheet(onClosing: (){}, builder:( builder){
        return Padding(
          padding:  EdgeInsets.only(bottom: 30.h),
          child: ButtonWidget(
            buttonText: 'save',
            isActive: isFull,
            onTap: () {
              navigatorPop(context);
            },
          ),
        );
      }),
    );
  }
}
