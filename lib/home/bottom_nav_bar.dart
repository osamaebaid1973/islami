import 'package:flutter/material.dart';
import 'package:islami/app_resources.dart';

class BottomNavBar extends StatefulWidget {
  final Function onChange;
  BottomNavBar({required this.onChange, super.key});

  @override
  State<BottomNavBar> createState() => _nameState();
}

class _nameState extends State<BottomNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: (value) {
          currentIndex = value;

          setState(() {});
          widget.onChange(currentIndex);
        },
        currentIndex: currentIndex,
        unselectedItemColor: AppColors.blackColor,
        selectedItemColor: Colors.white,
        backgroundColor: AppColors.primary,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: _buildItem('quran', 0), label: 'Quran'),
          BottomNavigationBarItem(
              icon: _buildItem('ahadeth', 1), label: 'Ahadeth'),
          BottomNavigationBarItem(icon: _buildItem('sebha', 2), label: 'Sebha'),
          BottomNavigationBarItem(icon: _buildItem('radio', 3), label: 'Radio'),
          BottomNavigationBarItem(icon: _buildItem('date', 4), label: 'Date')
        ]);
  }

  Widget _buildItem(String name, int index) {
    return currentIndex == index
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
                color: const Color(0x99202020),
                borderRadius: BorderRadius.circular(66)),
            child: ImageIcon(AssetImage('assets/images/$name.png')))
        : ImageIcon(AssetImage('assets/images/$name.png'));
  }
}
//

