import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:sehat/src/ui/main/main_screen.dart';
import 'package:sehat/src/ui/splash/splash_screen.dart';
import 'package:sehat/src/utils/cache_keys.dart';
import 'package:sehat/src/utils/cache_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheService.init();
  final prefs = await SharedPreferences.getInstance();
  final dynamic value = prefs.get(CacheKeys.token); // universal get
  String token = "";

  if (value != null) {
    if (value is String) {
      token = value;
    } else if (value is bool) {
      token = value ? "true" : "false";
    }
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('uz')],
      path: 'assets/translate',
      fallbackLocale: const Locale('uz'),
      startLocale: const Locale('uz'),
      child: AppStart(token: token),
    ),
  );
}

String priceFormat(num number) {
  if (number == number.toInt()) {
    return number.toInt().toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]} ',
    );
  } else {
    return number
        .toStringAsFixed(3)
        .replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+\.)'),
          (Match match) => '${match[1]} ',
        );
  }
}

class AppStart extends StatelessWidget {
  final String token;

  const AppStart({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MyApp(token: token);
  }
}

class MyApp extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldKey = GlobalKey<ScaffoldState>();
  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final String token;

  const MyApp({super.key, required this.token});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return ScreenUtilInit(
          designSize: orientation == Orientation.portrait
              ? const Size(375, 833)
              : const Size(833, 375),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp(
              navigatorKey: MyApp.navigatorKey,
              scaffoldMessengerKey: MyApp.messengerKey,
              theme: ThemeData(
                platform: TargetPlatform.iOS,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: 'Sehat',
              home: child,
            );
          },
          child: widget.token.isEmpty ? const SplashScreen() : const MainScreen(),
        );
      },
    );
  }
}
