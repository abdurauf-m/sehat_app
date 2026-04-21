import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehat/src/model/story_model.dart';

class StoryWidget extends StatelessWidget {
  final StoryModel storyModel;
  final void Function() onTap;
  const StoryWidget({super.key, required this.storyModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 64.r,
        height: 64.r,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: Image.asset(storyModel.image),
      ),
    );
  }
}
