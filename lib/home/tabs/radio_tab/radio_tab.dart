import 'package:flutter/material.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/home/tabs/radio_tab/custom_radio.dart';
import 'package:islami/home/tabs/radio_tab/custom_toggle_switch.dart';
import 'package:islami/models/radio_model.dart';

class RadioTab extends StatefulWidget {
  static const String routeName = 'RadioTab';

  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  String radio = 'Radio';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomToggleSwitch(onToggle: (int index) {
              _onTap(index);
            }),
            SizedBox(height: 10),
            CustomRadio(
              radioModel: RadioModel(
                  radioName: '$radio Ibrahim Al-Akdar',
                  playImageName: 'play.png',
                  voluneImageName: 'volume.png',
                  heartImageName: 'heart1.png',
                  radioBackgroungImageName: 'radio1_bg.png'),
            ),
            SizedBox(height: 10),
            CustomRadio(
              radioModel: RadioModel(
                  radioName: '$radio Al-Qaria Yassen',
                  playImageName: 'pause.png',
                  voluneImageName: 'volumeMuted.png',
                  heartImageName: 'heart1.png',
                  radioBackgroungImageName: 'radio2_bg.png'),
            ),
            SizedBox(height: 10),
            CustomRadio(
              radioModel: RadioModel(
                  radioName: '$radio Ahmed Al-trabulsi',
                  playImageName: 'play.png',
                  voluneImageName: 'volume.png',
                  heartImageName: 'heart2.png',
                  radioBackgroungImageName: 'radio1_bg.png'),
            ),
            SizedBox(height: 10),
            CustomRadio(
              radioModel: RadioModel(
                  radioName: '$radio Addokali Mohammad Alalim',
                  playImageName: 'play.png',
                  voluneImageName: 'volume.png',
                  heartImageName: 'heart2.png',
                  radioBackgroungImageName: 'radio1_bg.png'),
            )
          ],
        ),
      ),
    );
  }

  _onTap(int index) {
    if (index == 0) {
      radio = 'Radio';
    } else {
      radio = '';
    }
    setState(() {});
  }
}
