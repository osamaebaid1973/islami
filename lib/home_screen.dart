import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/home_bg.png'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              currentIndex: currentIndex,
              unselectedItemColor: Color(0XFF202020),
              selectedItemColor: Colors.white,
              backgroundColor: Color(0XFFE2BE7F),
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
}
//say hello to github
