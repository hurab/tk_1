
import 'dart:ui';


class Helper {
  static String getTransulatedValue(String? textAr, String? textEn,Locale locale) {
    if(locale.languageCode == "ar"){
      return textAr ?? "";
    }else{
      return textEn ?? "";
    }
  }
}