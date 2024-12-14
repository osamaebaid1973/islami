import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 36),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/onboarding_header.png'),
            TextField(cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: const ImageIcon(AssetImage('assets/images/search_icon.png'),color: AppColors.primary,),
                hintText: 'Sura Name',
                hintStyle: GoogleFonts.elMessiri(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary)),
              ),
            ),const SizedBox(height:20),
             Text('Most Recently',style: GoogleFonts.elMessiri(color: Colors.white, fontSize:16 ),)
          ],
        ),
      ),
    );
  }
}
