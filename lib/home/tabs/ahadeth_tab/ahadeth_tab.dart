import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/hadeth_details/hadeth_details.dart';
import 'package:islami/models/hadeth_model.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethModel> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      _loadHadethFile();
    }
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(height: double.infinity),
            items: ahadethList.map((hadeth) {
              return Builder(
                builder: (BuildContext context) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HadethDetails.routeName,
                          arguments: hadeth);
                    },
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          'assets/images/hadeth_bg.png',
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 32),
                              child: Text(hadeth.title,
                                  style: GoogleFonts.aBeeZee(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor)),
                            ),
                            const SizedBox(height: 40),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0),
                                child: Text(hadeth.content.first,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 9,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.blackColor)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  _loadHadethFile() async {
    String file = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> ahadeth = file.split('#');
    for (String hadeth in ahadeth) {
      List<String> lines = hadeth.trim().split('\n');
      String title = lines[0];
      lines.removeAt(0);
      List<String> content = lines;
      HadethModel hadethModel = HadethModel(title: title, content: content);
      ahadethList.add(hadethModel);
    }
    setState(() {});
  }
}
