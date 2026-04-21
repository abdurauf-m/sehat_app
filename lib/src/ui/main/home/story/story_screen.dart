import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';
import 'package:sehat/src/theme/navigators.dart';
import 'package:sehat/src/ui/main/main_screen.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            controller: storyController,
            storyItems: [
              _buildStoryItem(
                image: AppImages.second,
                text: "Advanced Dental Implants. Discover our latest painless laser treatment...",
              ),
              _buildStoryItem(
                image: AppImages.second,
                text: "Second Story Content goes here...",
              ),_buildStoryItem(
                image: AppImages.second,
                text: "Advanced Dental Implants. Discover our latest painless laser treatment...",
              ),
              _buildStoryItem(
                image: AppImages.second,
                text: "Second Story Content goes here...",
              ),
            ],
            onComplete: () => Navigator.of(context).pop(),
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) Navigator.of(context).pop();
            },
          ),

          Positioned(
            top: 50.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: AssetImage(AppImages.icon),
                ),
                Gap(10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Sehat Clinic", style: AppStyles.medium18(AppColors.white)),
                    Text("2h ago", style: AppStyles.regular12(AppColors.white.withOpacity(0.8))),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.2),
                    ),
                    child: Icon(Icons.close, color: Colors.white, size: 24.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  StoryItem _buildStoryItem({required String image, required String text}) {
    return StoryItem(
      Stack(
        children: [
          Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                  stops: const [0.6, 1.0],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            left: 20.w,
            right: 20.w,
            child: Text(text, style: AppStyles.bold18(AppColors.white)),
          ),
        ],
      ),
      duration: const Duration(seconds: 5),
    );
  }
}
