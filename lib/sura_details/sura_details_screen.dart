import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetails';
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadSuraFile(suraModel.index);
    }
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          iconTheme: IconThemeData(color: AppColors.primary),
          title: Text(suraModel.suraNameEn,
              style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary)),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/home_bg.png'),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  //mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    Text(suraModel.suraNameAr,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary)),
                    
                    const SizedBox(height:60),
                    Expanded(
                      child: ListView.separated(separatorBuilder: (context, index) {
                        return const SizedBox(height:16);
                      },
                        itemCount: verses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: AppColors.primary),
                            ),
                            child: Text('(${index+1}) ${verses[index]} ',
                                //textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary)),
                          );
                        },
                      ),
                    ),
                    //Text()
                  ],
                ),
              )
            ],
          ),
        ));
  }

  loadSuraFile(int index) async {
    String suraFile = await rootBundle.loadString('assets/files/$index.txt');
    List<String> lines = suraFile.split('\n');
    print(lines);
    verses = lines;
    setState(() {});
  }
}
