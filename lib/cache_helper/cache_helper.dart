import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
static late SharedPreferences prefs;
 static init () async{
   prefs = await SharedPreferences.getInstance();
 }
 static Future<bool> setOnboardingScreenSeen () async{
  return await prefs.setBool('onBoarding', true);
 }
 static Object? getOnboardingScreenSeen(String key) {
  return  prefs.get(key);
 }
}
//
