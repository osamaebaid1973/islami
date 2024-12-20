import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatefulWidget {
  Function onToggle;
  CustomToggleSwitch({required this.onToggle, super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      states: [true, true],
      customTextStyles: [GoogleFonts.elMessiri(fontSize: 16)],
      cornerRadius: 12,
      minWidth: double.infinity,
      minHeight: 40,
      fontSize: 16.0,
      initialLabelIndex: _index,
      activeBgColor: [AppColors.primary],
      activeFgColor: AppColors.blackColor,
      inactiveBgColor: Colors.transparent,
      inactiveFgColor: Colors.white,
      totalSwitches: 2,
      labels: ['Radio', 'Reciters'],
      onToggle: (index) {
        _index = index!;
        widget.onToggle(index);
        print('switched to $index');
      },
    );
  }
}
