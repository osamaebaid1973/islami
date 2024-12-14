import 'package:flutter/material.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/home/ahadeth_tab.dart';
import 'package:islami/home/bottom_nav_bar.dart';
import 'package:islami/home/date_tab.dart';
import 'package:islami/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami/home/radio_tab.dart';
import 'package:islami/home/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  
   const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTab(),const AhadethTab(),const SebhaTab(),const RadioTab(),const DateTab()];
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/${_getBackgroundImageName()}'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavBar(onChange: (index){
            currentIndex = index;
            setState(() {
              
            });
          },),
        ));
  }

 
  String _getBackgroundImageName(){
    switch(currentIndex){
      case 0 :
       return 'home_bg.png';
      case 1 :
       return 'ahadeth_bg.png'; 
      case 2 :
       return 'sebha_bg.png'; 
      case 3 :
       return 'radio_bg.png';
      case 4 :
       return 'date_bg.png';  
      default :
       return 'home_bg.png';
    }
  }
}
//say hello to github
//say hello to git
