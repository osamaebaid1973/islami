import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/models/sura_model.dart';

class SuraItemHorizontal extends StatelessWidget {
  SuraModel suraModel;
  SuraItemHorizontal({required this.suraModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                suraModel.suraNameEn,
                style: GoogleFonts.elMessiri(color: AppColors.blackColor, fontSize: 24),
              ),
              const SizedBox(height:8),
              Text(
                suraModel.suraNameAr,
                style: GoogleFonts.elMessiri(color: AppColors.blackColor, fontSize: 24),
              ),
              const SizedBox(height:8),
              Text(
                '${suraModel.numberOfVerses} verses',
                style: GoogleFonts.elMessiri(color: AppColors.blackColor, fontSize: 16),
              )
            ],
          ),
          Image.asset('assets/images/sura_item.png')
        ],
      ),
    );
  }
}
