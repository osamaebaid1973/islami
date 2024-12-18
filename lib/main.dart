import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami/cache_helper/cache_helper.dart';
import 'package:islami/hadeth_details/hadeth_details.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/onboarding_screen.dart';
import 'package:islami/sura_details/sura_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(scaffoldBackgroundColor: Colors.transparent),
      darkTheme: ThemeData(),
      debugShowCheckedModeBanner: false,
      initialRoute: CacheHelper.getOnboardingScreenSeen('onBoarding') == null
          ? OnboardingScreen.routeName
          : HomeScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        SuraDetailsScreen.routeName: (context) => const SuraDetailsScreen(),
        HadethDetails.routeName: (context) => const HadethDetails(),
      },
    );
  }
}
/*flutter_native_splash:
  background_image: "assets/images/ic_splash.png"
  image: assets/images/ic_splash.png
  branding: assets/images/branding.png
  branding_bottom_padding: 32

  android_12:
    image: assets/images/ic_splash.png
    color: "#202020"
    branding: assets/images/branding.png */