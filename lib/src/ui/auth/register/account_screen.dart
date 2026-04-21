import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/main_screen.dart';
import 'package:sehat/src/utils/cache_services.dart';
import 'package:sehat/src/widget/button_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? selectedGender;

  // Sanani tanlash funksiyasi
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('yyyy/MM/dd').format(picked);
      });
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
      appBar: AppBar(backgroundColor: AppColors.surfaceLight, elevation: 0),
      backgroundColor: AppColors.surfaceLight,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Complete your profile",
                    style: AppStyles.medium18(AppColors.primaryDark),
                  ),
                  Gap(4.h),
                  Text(
                    "This information helps us personalize your experience and ensure better care",
                    style: AppStyles.regular16(AppColors.grey),
                  ),
                  Gap(24.h),

                  // Full Name
                  _buildLabel("Full Name"),
                  Gap(8.h),
                  TextField(
                    controller: nameController,
                    style: AppStyles.medium14(AppColors.primaryDark),
                    decoration: inputDecoration("Pedro Duarte"),
                  ),
                  Gap(16.h),

                  // Gender Dropdown
                  _buildLabel("Gender"),
                  Gap(8.h),
                  DropdownButtonFormField<String>(
                    dropdownColor: AppColors.white,
                    value: selectedGender,
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.grey,
                    ),
                    style: AppStyles.medium14(AppColors.primaryDark),
                    decoration: inputDecoration("Sex"),
                    items: ["Male", "Female"].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedGender = newValue;
                      });
                    },
                  ),
                  Gap(16.h),

                  // Date of Birth
                  _buildLabel("Date of Birth"),
                  Gap(8.h),
                  TextField(
                    controller: dobController,
                    readOnly: true, // Klaviatura chiqmaydi
                    onTap: () =>
                        _selectDate(context), // Bosilganda kalendar chiqadi
                    style: AppStyles.medium14(AppColors.primaryDark),
                    decoration: inputDecoration("yyyy/mm/dd").copyWith(
                      suffixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ButtonWidget(
            buttonText: "Continue",
            isActive:
                nameController.text.isNotEmpty &&
                selectedGender != null &&
                dobController.text.isNotEmpty,
            onTap: () async {
              navigatorPushAndRemoveUntil(context, MainScreen());
              await CacheService.saveLogin(true);
              await CacheService.saveToken('true');
            },
          ),
          Gap(34.h),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: AppStyles.medium14(AppColors.primaryDark),
          ),
          TextSpan(text: " *", style: AppStyles.medium14(AppColors.error)),
        ],
      ),
    );
  }
}
