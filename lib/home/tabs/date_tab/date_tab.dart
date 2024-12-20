import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:islami/home/tabs/date_tab/abbreviated_hijri_month.dart';

class DateTab extends StatelessWidget {
  DateTab({super.key});

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
      child: Stack(
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
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                Spacer(),
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Text(
                      '${hijriDate.hDay} $abbreviatedMonth ${hijriDate.hYear}',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
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
                  borderRadius: BorderRadius.circular(40)))
        ],
      ),
    );
  }
}
