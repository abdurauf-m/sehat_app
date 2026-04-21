import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/model/services_model.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/services/service_details_screen.dart';
import 'package:sehat/src/widget/services_widget.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  List<ServicesModel> servicesModel = [
    ServicesModel(name: "Cardiology", image: AppImages.heart),
    ServicesModel(name: "Stamatology", image: AppImages.teath),
    ServicesModel(name: "Neurology", image: AppImages.brain),
    ServicesModel(name: "Ophthalmology", image: AppImages.eye),
    ServicesModel(name: "Laboratory", image: AppImages.laboratory),
    ServicesModel(name: "Dermatology", image: AppImages.hair),
    ServicesModel(name: "Otolaryngology", image: AppImages.ear),
    ServicesModel(name: "Orthopedics", image: AppImages.suyak),
    ServicesModel(name: "Endocrinology", image: AppImages.body),
    ServicesModel(name: "Pulmonology", image: AppImages.opka),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyUltraLight,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text("Services", style: AppStyles.medium16(AppColors.black)),
      ),
      body: GridView.builder(
        itemCount: servicesModel.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          mainAxisExtent: 115.h,
        ),
        padding: EdgeInsets.only(
          left: 10.w,
          right: 10.w,
          top: 10.h,
          bottom: 110.h,
        ),
        itemBuilder: (ctx, index) {
          return ServicesWidget(
            servicesModel: servicesModel[index],
            onTap: () {
              navigatorPush(
                context,
                ServiceDetailsScreen(servicesModel: servicesModel[index]),
              );
            },
          );
        },
      ),
    );
  }
}
