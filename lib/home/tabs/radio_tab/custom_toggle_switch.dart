import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatelessWidget {
  const CustomToggleSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      customTextStyles: [GoogleFonts.elMessiri(fontSize: 16)],
      cornerRadius: 12,
      minWidth: double.infinity,
      minHeight: 40,
      fontSize: 16.0,
      initialLabelIndex: 1,
      activeBgColor: [AppColors.primary],
      activeFgColor: AppColors.blackColor,
      inactiveBgColor: Colors.transparent,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['Radio', 'Reciters'],
      onToggle: (index) {
        print('switched to: $index');
      },
    );
  }
}
