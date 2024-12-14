import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:islami/home/home_screen.dart';
import 'package:islami/onboarding_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MainApp(),
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
      theme: ThemeData(),//.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        HomeScreen.routeName: (context) => HomeScreen()
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