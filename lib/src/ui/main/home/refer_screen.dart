import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {
  List<String> media = [
    AppImages.facebook,
    AppImages.instagram,
    AppImages.telegram,
    AppImages.whatsapp,
    AppImages.x,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text(
          'Refer a friend',
          style: AppStyles.medium18(AppColors.primaryDark),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Together to Health!',
              style: AppStyles.medium24(AppColors.black),
            ),
            Gap(10.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        'nvite your friends to our clinic. When they book their first appointment, you both get a ',
                    style: AppStyles.regular16(AppColors.grey),
                  ),
                  TextSpan(
                    text: '10% discount',
                    style: AppStyles.regular16(AppColors.accentPink),
                  ),
                  TextSpan(
                    text: ' on next services',
                    style: AppStyles.regular16(AppColors.grey),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            Text(
              'Copy and share your code',
              style: AppStyles.medium16(AppColors.primaryDark),
            ),
            Gap(10.h),
            Container(
              width: 1.sw,
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'https://referallinktofriend1234567',
                      style: AppStyles.regular16(AppColors.black),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(
                        const ClipboardData(
                          text: 'https://referallinktofriend1234567',
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.surfaceLight,
                          content: Text(
                            "Copied to clipboard",
                            style: AppStyles.medium16(AppColors.primaryDark),
                          ),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    child: SvgPicture.asset(AppIcons.copy),
                  ),
                ],
              ),
            ),
            Gap(24.h),
            Row(
              children: [
                Expanded(child: Divider(color: AppColors.border)),
                Gap(7.w),
                Text(
                  'Or Invite by',
                  style: AppStyles.regular16(AppColors.grey),
                ),
                Gap(7.w),
                Expanded(child: Divider(color: AppColors.border)),
              ],
            ),
            Gap(24.h),
            SizedBox(
              height: 60.h,
              width: 1.sw,
              child: Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return Center(
                      child: Container(
                        width: 52.w,
                        height: 52.h,
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.all(9.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: AppColors.white,
                        ),
                        child: Image.asset(media[index], fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              ),
            ),
            Gap(24.h),
            Container(
              padding: EdgeInsets.all(16.w),
              width: 1.sw,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invited Friends: 2',
                    style: AppStyles.medium18(AppColors.primaryDark),
                  ),
                  Gap(16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nickname',
                        style: AppStyles.semiBold12(AppColors.grey),
                      ),
                      Text(
                        'Joined',
                        style: AppStyles.semiBold12(AppColors.grey),
                      ),
                    ],
                  ),
                  Gap(8.h),
                  Divider(
                    color: AppColors.border.withOpacity(0.4),
                    height: 0.4.w,
                  ),
                  Gap(16.h),
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.accentOrange,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'J',
                          style: AppStyles.bold14(AppColors.white),
                        ),
                      ),
                      Gap(12.w),
                      Text(
                        'John S.',
                        style: AppStyles.regular14(AppColors.grey),
                      ),
                      Spacer(),
                      Text(
                        '2026.02.25',
                        style: AppStyles.regular12(AppColors.grey),
                      ),
                    ],
                  ),
                  Gap(24.h),
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.success,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'S',
                          style: AppStyles.bold14(AppColors.white),
                        ),
                      ),
                      Gap(12.w),
                      Text(
                        'Sarah J.',
                        style: AppStyles.regular14(AppColors.grey),
                      ),
                      Spacer(),
                      Text(
                        '2026.02.03',
                        style: AppStyles.regular12(AppColors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
