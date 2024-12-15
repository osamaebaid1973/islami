import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/sura_model.dart';

class SuraNameItem extends StatelessWidget {
  SuraModel suraModel;
  SuraNameItem(
      {required this.suraModel,
      super.key});
  // int x;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/Sura_Number.png',
              ),
               Padding(
                 padding: const EdgeInsets.only(top:4.0),
                 child: Text('${suraModel.index}',style:
                          GoogleFonts.elMessiri(color: Colors.white, fontSize: 16)),
               )
            ],
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(suraModel.suraNameEn,
                  style:
                      GoogleFonts.elMessiri(color: Colors.white, fontSize: 16)),
              Text('${suraModel.numberOfVerses}',
                  style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 16))
            ],
          ),
          Text(suraModel.suraNameAr,
              style: GoogleFonts.elMessiri(color: Colors.white, fontSize: 16))
        ],
      ),
    );
  }
}
