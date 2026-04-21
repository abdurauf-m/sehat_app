import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat/src/theme/app_colors.dart';
import 'package:sehat/src/theme/app_icons.dart';
import 'package:sehat/src/theme/app_images.dart';
import 'package:sehat/src/theme/app_styles.dart';

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime time;

  ChatMessage({required this.text, required this.isUser, required this.time});
}

class ChatSession {
  final String id;
  String title;
  final String category;
  final List<ChatMessage> messages;

  ChatSession({
    required this.id,
    required this.title,
    required this.category,
    required this.messages,
  });
}

class HistoryDrawer extends StatelessWidget {
  final List<ChatSession> sessions;
  final String activeSessionId;
  final Function(String) onSessionSelected;
  final VoidCallback onNewChat;

  const HistoryDrawer({
    super.key,
    required this.sessions,
    required this.activeSessionId,
    required this.onSessionSelected,
    required this.onNewChat,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                onNewChat();
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Row(
                  children: [
                    Icon(Icons.add, color: AppColors.primary, size: 24.sp),
                    SizedBox(width: 8.w),
                    Text(
                      "New Chat",
                      style: AppStyles.semiBold16(AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                children: [
                  if (sessions.any((s) => s.category == "TODAY")) ...[
                    _buildSectionHeader("TODAY"),
                    ...sessions
                        .where((s) => s.category == "TODAY")
                        .map((s) => _buildHistoryItem(context, s)),
                  ],
                  if (sessions.any((s) => s.category == "YESTERDAY")) ...[
                    SizedBox(height: 24.h),
                    _buildSectionHeader("YESTERDAY"),
                    ...sessions
                        .where((s) => s.category == "YESTERDAY")
                        .map((s) => _buildHistoryItem(context, s)),
                  ],
                  if (sessions.any((s) => s.category == "PREVIOUS 7 DAYS")) ...[
                    SizedBox(height: 24.h),
                    _buildSectionHeader("PREVIOUS 7 DAYS"),
                    ...sessions
                        .where((s) => s.category == "PREVIOUS 7 DAYS")
                        .map((s) => _buildHistoryItem(context, s)),
                  ],
                ],
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: CircleAvatar(
                radius: 18.r,
                backgroundImage: AssetImage(AppImages.person),
              ),
              title: Text(
                "John Anderson",
                style: AppStyles.medium14(AppColors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Text(
        title,
        style: AppStyles.medium12(AppColors.greyLight).copyWith(letterSpacing: 1),
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, ChatSession session) {
    final isActive = session.id == activeSessionId;
    return InkWell(
      onTap: () {
        onSessionSelected(session.id);
        Navigator.pop(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          session.title,
          style: AppStyles.regular16(isActive ? AppColors.primary : AppColors.greyDark)
              .copyWith(fontWeight: isActive ? FontWeight.w600 : FontWeight.w400),
        ),
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;
  final VoidCallback onClosePressed;

  const ChatAppBar({
    super.key,
    required this.onMenuPressed,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.primary),
        onPressed: onMenuPressed,
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Chat with AI",
            style: AppStyles.semiBold18(AppColors.black),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6.w,
                height: 6.w,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                "ONLINE",
                style: AppStyles.medium10(AppColors.greyLight),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: AppColors.primary),
          onPressed: onClosePressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}

class UserMessageBubble extends StatelessWidget {
  final String text;
  const UserMessageBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(left: 40.w, bottom: 16.h, right: 20.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xff001E62),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
        child: Text(
          text,
          style: AppStyles.regular16(AppColors.white),
        ),
      ),
    );
  }
}

class AiMessageBubble extends StatelessWidget {
  final String text;
  const AiMessageBubble({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 40.w, bottom: 16.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: const Color(0xffE2EFFF),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(AppIcons.ai, width: 16.w),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                  border: Border.all(color: AppColors.greySoft),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: AppStyles.regular16(AppColors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: const Color(0xff001E62), size: 16.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              text,
              style: AppStyles.regular14(AppColors.greyDark),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.greySoft),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset(AppImages.cardiologist, width: 44.w, height: 44.w, fit: BoxFit.cover),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Noah Thomson",
                style: AppStyles.semiBold14(AppColors.black),
              ),
              Text(
                "Dentist",
                style: AppStyles.regular12(AppColors.greyLight),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffF1F5F9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        label,
        style: AppStyles.semiBold14(AppColors.black),
      ),
    );
  }
}

class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.greySoft)),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xffF1F5F9),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add, color: AppColors.grey, size: 24.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xffF8FAFC),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Ask questions...",
                  hintStyle: AppStyles.regular14(AppColors.greyLight),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: onSend,
            child: Container(
              padding: EdgeInsets.all(10.w),
              decoration: const BoxDecoration(
                color: Color(0xff001E62),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(AppIcons.send, width: 20.w, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
