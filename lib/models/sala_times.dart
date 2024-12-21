import 'package:prayer_time/prayer_time.dart';

class SalaTimes {
  String salaName;
  String salaTime;

  SalaTimes({required this.salaName, required this.salaTime});
  static const List<String> salaNames = [
    'Fajr',
    'Sunrise',
    'Dhuhr',
    'Asr',
    'Sunset',
    'Maghrib',
    'Isha'
  ];
  static PrayTime prayTime = PrayTime(method: Egypt);
  static var times = prayTime.getPrayerTimes({
    "year": DateTime.now().year,
    "mday": DateTime.now().day,
    "mon": DateTime.now().month,
  }, 31.170406299999996, 72.7097161, 5);
  static List<SalaTimes> getSalaTimes() {
    List<SalaTimes> salaTimes = [];
    for (int i = 0; i < salaNames.length; i++) {
      if (i != 1 && i != 4) {
        salaTimes.add(SalaTimes(salaName: salaNames[i], salaTime: times[i]));
      }
    }
    return salaTimes;
  }
}
