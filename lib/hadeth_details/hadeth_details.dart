import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/models/hadeth_model.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = 'Hadeth Details';
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    HadethModel model =
        ModalRoute.of(context)!.settings.arguments as HadethModel;
    return Scaffold(
        backgroundColor: AppColors.blackColor,
        appBar: AppBar(
          backgroundColor: AppColors.blackColor,
          iconTheme: const IconThemeData(color: AppColors.primary),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset('assets/images/home_bg.png'),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: Column(
                  //mainAxisAlignment : MainAxisAlignment.center,
                  children: [
                    Text(model.title,
                        style: GoogleFonts.aBeeZee(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary)),

                    const SizedBox(height: 60),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 16);
                        },
                        itemCount: model.content.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(model.content[index],
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
}
