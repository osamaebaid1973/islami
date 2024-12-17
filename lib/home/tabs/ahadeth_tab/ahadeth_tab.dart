import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ahadethList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset('assets/images/hadeth_bg.png'),
                  Text(ahadethList[index].title,
                      style: GoogleFonts.aBeeZee(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor))
                ],
              ); /*;*/
            },
          ),
        ),
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
