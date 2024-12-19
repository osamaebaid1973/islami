import 'package:flutter/material.dart';
import 'package:islami/home/tabs/radio_tab/custom_radio.dart';
import 'package:islami/home/tabs/radio_tab/custom_toggle_switch.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'RadioTab';
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [CustomToggleSwitch(), CustomRadio()],
      ),
    );
  }
}
