
import 'package:intl/intl.dart';

class StaticFunctions {
  static int getAge(DateTime birthDay) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDay.year;
    int month1 = currentDate.month;
    int month2 = birthDay.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDay.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }
  static String getChatTime(DateTime date){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    final aDate = DateTime(date.year, date.month, date.day);
    if (aDate==yesterday) {
      return "Yesterday";
    }
    else if(aDate==today){
      final format = DateFormat.jm(); 
      return format.format(date);
    }
    else{
      return "${date.day}/${date.month}/${date.year}";
    }
  }

//   static String getArea(Area area) {
//     Map<String, Map<Area, String>> areaText = {
//       "he": {
//         Area.BEER_SHEVA: "באר שבע והדרום",
//         Area.CHUL: 'חו"ל',
//         Area.GUSH_DAN: "גוש דן",
//         Area.HIFA: "חיפה והצפון",
//         Area.JERUSALEM: "ירושלים והסביבה",
//         Area.SHARON: "השרון",
//       },
//       "en": {
//         Area.BEER_SHEVA:  "Be'er Sheva",
//         Area.CHUL:        "chul",
//         Area.GUSH_DAN:    "Gush Dan",
//         Area.HIFA:        "Haifa",
//         Area.JERUSALEM:   "Jerusalem",
//         Area.SHARON:      "Sharon",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][area] : area.toString().split(".").last;
//   }

//   static String getCountry(Country country) {
//     Map<String, Map<Country, String>> areaText = {
//       "he": {
//         Country.ISRAEL:       "ישראל",
//         Country.AUSTRALIA:    'אוסטרליה',
//         Country.CANADA:       "קנדה",
//         Country.BELGIUM:      "בלגיה",
//         Country.UK:           "אנגליה",
//         Country.USA:          "ארצות הברית",
//         Country.SWITZERLAND:  "שוייץ",
//       },
//       "en": {
//         Country.ISRAEL:      "Israel",
//         Country.AUSTRALIA:   'Australia',
//         Country.CANADA:      "Canada",
//         Country.BELGIUM:     "Belgium",
//         Country.UK:          "UK",
//         Country.USA:         "USA",
//         Country.SWITZERLAND: "Switzerland",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][country] : country.toString().split(".").last;
//   }

//   static String getStatus(Status status) {
    
//     Map<String, Map<Status, String>> areaText = {
//       "he": {
//         Status.SINGLE: "רווק/ה",
//         Status.ALMAN:  'אלמנ/ה',
//         Status.GARUSH: "גרוש/ה",
//       },
//       "en": {
//         Status.SINGLE: "Single",
//         Status.ALMAN: ' Widow',
//         Status.GARUSH: "Divorced",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][status] : status.toString().split(".").last;
//   }

//   static String getDos(Dos dos) {
//     Map<String, Map<Dos, String>> areaText = {
//       "he": {
//         Dos.MASORTI:  "מסורתי",
//         Dos.LITE:     'לייט',
//         Dos.REGULAR:  "רגיל",
//         Dos.VERY:     'מאוד',
//         Dos.DOS:      "דוס",
//       },
//       "en": {
//         Dos.MASORTI: "Masorati",
//         Dos.LITE:    'lite',
//         Dos.REGULAR: "regular",
//         Dos.VERY:    'very',
//         Dos.DOS:     "Dos",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][dos] : dos.toString().split(".").last;
//   }

//   static String getHashkafa(Hashkafa hashkafa) {
//     Map<String, Map<Hashkafa, String>> areaText = {
//       "he": {
//         Hashkafa.LEUMI:   "לאומי",
//         Hashkafa.CHAREDI: 'חרדי',
//         Hashkafa.CHABAD:  "חבד",
//         Hashkafa.BRESLUV: 'ברסלב',
//         Hashkafa.CHOZER_BITSHUVA: "חוזר בתשובה",
//         Hashkafa.JEW: "יהודי",
//       },
//       "en": {
//         Hashkafa.LEUMI:   "Leumi",
//         Hashkafa.CHAREDI: 'Charedi',
//         Hashkafa.CHABAD:  "Chabas",
//         Hashkafa.BRESLUV: 'Breslav',
//         Hashkafa.CHOZER_BITSHUVA: "Chozer Bitshuva",
//         Hashkafa.JEW: "Jew",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][hashkafa] : hashkafa.toString().split(".").last;
//   }

//   static String getEda(Eda eda) {
//     Map<String, Map<Eda, String>> areaText = {
//       "he": {
//         Eda.ASHKENAZI:  "אשכנז",
//         Eda.SEFARADI:   'ספרדי',
//         Eda.TEMANI:     "תמני",
//         Eda.ETYOPI:     'אתיופי',
//         Eda.FRENCH:     "צרפתי",
//         Eda.MIXED:      "מעורב",
//       },
//       "en": {
//         Eda.ASHKENAZI: "Ashkenazi",
//         Eda.SEFARADI:  'Sefaradi',
//         Eda.TEMANI:    "Temani",
//         Eda.ETYOPI:    'Etyopi',
//         Eda.FRENCH:    "French",
//         Eda.MIXED:     "Mixed",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][eda] : eda.toString().split(".").last;
//   }

//   static String getSmoke(Smoke smoke) {
//     Map<String, Map<Smoke, String>> areaText = {
//       "he": {
//         Smoke.NO: "לא",
//         Smoke.SOMETIMES: 'לפעמים',
//         Smoke.TRY_TO_STOP: "מנסה להפסיק",
//         Smoke.YES: 'כן',
//       },
//       "en": {
//         Smoke.NO: "no",
//         Smoke.SOMETIMES: 'Sometimes',
//         Smoke.TRY_TO_STOP: "Try yo stop",
//         Smoke.YES: 'yes',
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][smoke] : smoke.toString().split(".").last;
//   }

//   static String getSherutGirl(SherutGirl sherutGirl) {
//     Map<String, Map<SherutGirl, String>> areaText = {
//       "he": {
//         SherutGirl.ARMY:    "צבא",
//         SherutGirl.MECHINA: 'מכינה',
//         SherutGirl.ONE_YEAR_SHERUT: "שנה שירות",
//         SherutGirl.TWO_YEARS_SHERUT: 'שנתים שירות',
//         SherutGirl.MIDRASHA: "מדרשה",
//         SherutGirl.SHLICHUT: 'שליחות',
//         SherutGirl.GURNISHT: "אחר",
//       },
//       "en": {
//         SherutGirl.ARMY:    'Army',
//         SherutGirl.MECHINA: "Mechina",
//         SherutGirl.ONE_YEAR_SHERUT: ' One Year Sherut',
//         SherutGirl.TWO_YEARS_SHERUT: "Two Years Sherut",
//         SherutGirl.MIDRASHA: 'Midrasha',
//         SherutGirl.SHLICHUT: "Shlichut",
//         SherutGirl.GURNISHT: 'Other',
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][sherutGirl] : sherutGirl.toString().split(".").last;
//   }

// //enum CompareScore{NOT_KASHUR,KACHA,MAYBE,YALA}
//   static String getSherutBoy(SherutBoy sherutBoy) {
//     Map<String, Map<SherutBoy, String>> areaText = {
//       "he": {
//         SherutBoy.KRAVI:    "קרבי",
//         SherutBoy.JOBNIK:   "ג'וב",
//         SherutBoy.MECHINA:  "מכינה",
//         SherutBoy.HESDER:   'ישיבת הסדר',
//         SherutBoy.GVOHA:    "ישיבה גבוהה",
//         SherutBoy.SHERUT:   'שירות',
//         SherutBoy.SHLICHUT: "שליחות",
//         SherutBoy.GURNISH:  "אחר",
//       },
//       "en": {
//         SherutBoy.KRAVI:   "Kravi",
//         SherutBoy.JOBNIK:  'Jobnik',
//         SherutBoy.MECHINA: "Mechina",
//         SherutBoy.HESDER:  'Hesder Yeshiva',
//         SherutBoy.GVOHA:   "Yeshiva Gvoha",
//         SherutBoy.SHERUT:  'Sherut',
//         SherutBoy.SHLICHUT:"Shlichut",
//         SherutBoy.GURNISH: "Other",
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][sherutBoy] : sherutBoy.toString().split(".").last;
//   }

//   static String getCompareScore(CompareScore compareScore) {
//     Map<String, Map<CompareScore, String>> areaText = {
//       "he": {
//         CompareScore.NOT_KASHUR: "לא קשור",
//         CompareScore.MAYBE:      "יכול להיות",
//         CompareScore.YALA:        'יאלה',
//       },
//       "en": {
//         CompareScore.NOT_KASHUR: "No way",
//         CompareScore.MAYBE:      "Could be",
//         CompareScore.YALA:       'Do it',
//       }
//     };
//     return areaText[MyApp.getLocale()] != null ? areaText[MyApp.getLocale()][compareScore] : compareScore.toString().split(".").last;
//   }

  static String combinedID(String id1,String id2){
    if (id1.compareTo(id2)==-1) {
      return id1+id2;
    }
    return id2+id1;
  } 
}
