import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = '/';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Color(0XFFE2BE7F));
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Color(0XFFE2BE7F)),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0XFF202020),
      imagePadding: EdgeInsets.zero,
    );
    return SafeArea(
      child: IntroductionScreen(dotsFlex: 2,dotsDecorator: DotsDecorator(color: Color(0XFF707070),activeColor: Color(0XFFFFD482)),
        showBackButton: true,
        back: Text('back',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0XFFE2BE7F))),
        showDoneButton: true, onDone: () {}, done: Text('done',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0XFFE2BE7F))),
        showNextButton: true, next: Text('next',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0XFFE2BE7F))),
        globalBackgroundColor: Color(0XFF202020),
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
          ),
          PageViewModel(
            title: "Holy Quran Radio",
            body:
                "You can listen to the Holy Quran Radio through the application for free and easily",
            image: _buildImage('onboarding5.png'),
          )
        ],
      ),
    );
  }
}

Widget _buildImage(String assetName, [double width = 350]) {
  return Image.asset('assets/images/$assetName', width: width);
}
