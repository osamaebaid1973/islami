import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:islami/app_resources.dart';
import 'package:islami/home/tabs/date_tab/abbreviated_hijri_month.dart';
import 'package:islami/home/tabs/date_tab/sala.dart';
import 'package:islami/models/sala_times.dart';

class DateTab extends StatefulWidget {
  DateTab({super.key});

  @override
  State<DateTab> createState() => _DateTabState();
}

class _DateTabState extends State<DateTab> {
  List<SalaTimes> salaTimes = SalaTimes.getSalaTimes();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM yyyy').format(now);
    HijriCalendar.setLocal('en');
    var hijriDate = HijriCalendar.now();
    String abbreviatedMonth =
        monthAbbreviations[hijriDate.longMonthName] ?? hijriDate.longMonthName;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                width: double.infinity,
                height: 300,
                // margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0XFF856B3F),
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Text(formattedDate,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Text(
                          '${hijriDate.hDay} $abbreviatedMonth ${hijriDate.hYear}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/sala_bg.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(40)),
                child: Sala(),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text('Azkar',
                style: GoogleFonts.elMessiri(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            children: <Widget>[
              Image.asset(
                'assets/images/Evening_Azkar.png',
                width: 150,
              ),
              const SizedBox(width: 48),
              Image.asset(
                'assets/images/Evening_Azkar.png',
                width: 150,
              ),
            ],
          )
        ],
      ),
    );
  }
}
