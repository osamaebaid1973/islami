import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      height: 141,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/radio1_bg.png',
            ),
            fit: BoxFit.fill),
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text('Ibrahim Al-Akdar',
            style: GoogleFonts.elMessiri(
                color: AppColors.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/vector.png'),
            const SizedBox(width: 24),
            Image.asset('assets/images/play.png'),
            const SizedBox(width: 24),
            Image.asset('assets/images/volume.png'),
          ],
        )
      ]),
    );
  }
}
