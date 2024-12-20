import 'package:flutter/material.dart';
import 'package:islami/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:islami/home/bottom_nav_bar.dart';
import 'package:islami/home/tabs/date_tab/date_tab.dart';
//import 'package:islami/home/date_tab.dart';
import 'package:islami/home/tabs/quran_tab/quran_tab.dart';
//import 'package:islami/home/radio_tab.dart';
import 'package:islami/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami/home/tabs/sebha_tab/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    DateTab()
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image:
                    AssetImage('assets/images/${_getBackgroundImageName()}'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/onboarding_header.png'),
              Expanded(child: tabs[currentIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            onChange: (index) {
              currentIndex = index;
              setState(() {});
            },
          ),
        ));
  }

  String _getBackgroundImageName() {
    switch (currentIndex) {
      case 0:
        return 'home_bg.png';
      case 1:
        return 'ahadeth_bg.png';
      case 2:
        return 'sebha_bg.png';
      case 3:
        return 'radio_bg.png';
      case 4:
        return 'date_bg.png';
      default:
        return 'home_bg.png';
    }
  }
}
