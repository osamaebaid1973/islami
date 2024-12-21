import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/models/sala_times.dart';
import 'package:prayer_time/prayer_time.dart';

class Sala extends StatefulWidget {
  const Sala({super.key});

  @override
  State<Sala> createState() => _SalaState();
}

class _SalaState extends State<Sala> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<SalaTimes> salaTimes = SalaTimes.getSalaTimes();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'Pray Time',
            style: GoogleFonts.elMessiri(
                color: AppColors.blackColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          getDayName(DateTime.now()),
          style: GoogleFonts.elMessiri(
              color: AppColors.blackColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Expanded(
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              //reverse: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
              //height: 200, // Height of the carousel
              viewportFraction: 0.8, // Controls the width of each slide
              enlargeCenterPage: true, // Enlarges the center slide
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: salaTimes.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      width: 104,
                      height: 128,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          //color: Colors.cyan,
                          gradient: LinearGradient(
                            colors: [
                              Colors.brown.withOpacity(0.8),
                              Colors.transparent,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              i.salaName,
                              style: GoogleFonts.elMessiri(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(i.salaTime.split(' ')[0],
                                style: GoogleFonts.elMessiri(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold)),
                            Text(i.salaTime.split(' ')[1],
                                style: GoogleFonts.elMessiri(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Text(
          'Next Pray - ${salaTimes[_currentIndex + 1].salaTime}',
          style: GoogleFonts.elMessiri(
              color: AppColors.blackColor,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String getDayName(DateTime date) {
    const days = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    // Subtract 1 because weekday starts at 1 (Monday).
    return days[date.weekday - 1];
  }
}
