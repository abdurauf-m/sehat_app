import 'package:flutter/material.dart';

class AppColors {
  /// ===== BASE =====
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);

  /// ===== BACKGROUND =====
  static const Color backgroundDark = Color(0xff020617);
  static const Color background = Color(0xff001E62);
  static const Color surface = Color(0xff1E1E1E);
  static const Color surfaceLight = Color(0xffF8FAFC);

  /// ===== PRIMARY (BLUE) =====
  static const Color primary = Color(0xff001E62);
  static const Color primaryDark = Color(0xff000C27);
  static const Color primaryLight = Color(0xff344BDC);
  static const Color primaryBright = Color(0xff032DD3);

  /// ===== ACCENT =====
  static const Color accentPink = Color(0xffEE3D69);
  static const Color accentRed = Color(0xffF52222);
  static const Color accentOrange = Color(0xffFFBF00);

  /// ===== GREY SCALE =====
  static const Color greyDark = Color(0xff1A1A1A);
  static const Color grey = Color(0xff64748B);
  static const Color greyLight = Color(0xff94A3B8);
  static const Color greySoft = Color(0xffEDEDED);
  static const Color greyUltraLight = Color(0xffF5F5F5);

  /// ===== TEXT =====
  static const Color textPrimary = Color(0xffffffff);
  static const Color textSecondary = Color(0xffE2E8F0);
  static const Color textMuted = Color(0xff899AD5);

  /// ===== STATUS =====
  static const Color success = Color(0xff22C55E);
  static const Color error = Color(0xffEF4444);
  static const Color warning = Color(0xffFBBF24);

  /// ===== BORDER =====
  static const Color border = Color(0xffE2E8F0);

  /// ===== SPECIAL =====
  static const Color card = Color(0xff202327);
  static const Color overlayDark = Color(0xE6151515); // 90%
  static const Color overlayLight = Color(0x0A000000); // 4%

  /// ===== GRADIENTS =====#
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xffEE3D69), Color(0xff344BDC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient lightGradient = LinearGradient(
    colors: [Color(0xffF8FAFC), Color(0xffFAFAFA)],
  );
}
