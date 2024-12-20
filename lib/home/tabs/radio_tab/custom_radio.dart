import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/models/radio_model.dart';

class CustomRadio extends StatelessWidget {
  RadioModel radioModel;
  CustomRadio({required this.radioModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      height: 141,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/${radioModel.radioBackgroungImageName}',
            ),
            fit: BoxFit.cover),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(radioModel.radioName,
            style: GoogleFonts.elMessiri(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/${radioModel.heartImageName}',
              //color: radioModel.heartColor,
            ),
            const SizedBox(width: 24),
            Image.asset('assets/images/${radioModel.playImageName}'),
            const SizedBox(width: 24),
            Image.asset('assets/images/${radioModel.voluneImageName}'),
          ],
        )
      ]),
    );
  }
}
