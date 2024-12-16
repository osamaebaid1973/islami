import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'SuraDetails';
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)?.settings.arguments as SuraModel;
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.primary),
          title: Text(suraModel.suraNameEn,
              style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary)),
        ),
        body: Stack(alignment: Alignment.topCenter,
          children: [Image.asset('assets/images/home_bg.png'),
            Container(margin: EdgeInsets.only(top:16),
              child: Text(suraModel.suraNameAr,
                style: GoogleFonts.aBeeZee(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary)),
            )
          ],
        ));
    ;
  }
}
