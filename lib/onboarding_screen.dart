import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/home/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = '/';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.elMessiri(
        fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primary);
    var pageDecoration = PageDecoration(
      imageFlex:2,
      titleTextStyle: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: AppColors.primary),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: AppColors.blackColor,
      imagePadding: const EdgeInsets.only(top: 20
      )
    );
    return SafeArea(
      child: IntroductionScreen(
        globalHeader: Image.asset('assets/images/onboarding_header.png'),
        dotsFlex: 2,
        dotsDecorator: const DotsDecorator(
            color: Color(0XFF707070), activeColor: Color(0XFFFFD482)),
        showBackButton: true,
        back: const Text('back',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        showDoneButton: true,
        onDone: () {
          Navigator.pushNamed(context, HomeScreen.routeName);
        },
        done: const Text('finish',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        showNextButton: true,
        next: const Text('next',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary)),
        globalBackgroundColor: AppColors.blackColor,
        allowImplicitScrolling: false,

        //autoScrollDuration: 3000,
        infiniteAutoScroll: false,

        pages: [
          PageViewModel(
            title: "Welcome To Islmi App",
            body: "",
            image: _buildImage('onboarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Welcome To Islmi App",
            body: "We Are Very Excited To Have You In Our Community",
            image: _buildImage('onboarding2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Reading the Quran",
            body: "Read, and your Lord is the Most Generous",
            image: _buildImage('onboarding3.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Bearish",
            body: "Praise the name of your Lord, the Most High",
            image: _buildImage('onboarding4.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can listen to the Holy Quran Radio through the application for free and easily",
            image: _buildImage('onboarding5.png'),
            decoration: pageDecoration,
          )
        ],
      ),
    );
  }
}

Widget _buildImage(String assetName, [double width = 350]) {
  return Image.asset('assets/images/$assetName', width: width, height: 250,);
}
