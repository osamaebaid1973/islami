import 'package:flutter/material.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/home/ahadeth_tab.dart';
import 'package:islami/home/date_tab.dart';
import 'package:islami/home/quran_tab.dart';
import 'package:islami/home/radio_tab.dart';
import 'package:islami/home/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTab(),AhadethTab(),SebhaTab(),RadioTab(),DateTab()];
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
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              currentIndex: currentIndex,
              unselectedItemColor: AppColors.blackColor,
              selectedItemColor: Colors.white,
              backgroundColor: AppColors.primary,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: _buildItem('quran', 0),
                    label: 'Quran'),
                BottomNavigationBarItem(
                    icon:  _buildItem('ahadeth', 1),
                    label: 'Ahadeth'),
                BottomNavigationBarItem(
                    icon: _buildItem('sebha', 2),
                    label: 'Sebha'),
                BottomNavigationBarItem(
                   icon: _buildItem('radio', 3),
                    label: 'Radio'),
                BottomNavigationBarItem(
                    icon: _buildItem('date', 4),
                    label: 'Date')
              ]),
        ));
  }

  Widget _buildItem(String name, int index) {
    return currentIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                color: Color(0x99202020),
                borderRadius: BorderRadius.circular(66)),
            child: ImageIcon(AssetImage('assets/images/$name.png')))
        : ImageIcon(AssetImage('assets/images/$name.png'));
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
