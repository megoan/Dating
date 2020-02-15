enum Gender {MALE,FEMALE}
enum Area {GUSH_DAN,SHARON,JERUSALEM,BEER_SHEVA,HIFA,CHUL}
enum Country{AUSTRALIA,BELGIUM,CANADA,ISRAEL,UK,USA,SWITZERLAND}
enum Status{SINGLE,ALMAN,GARUSH}
enum Dos{MASORTI, LITE, REGULAR,VERY,DOS}
enum Hashkafa{LEUMI,CHAREDI,CHABAD,BRESLUV,CHOZER_BITSHUVA,JEW}
enum Eda {ASHKENAZI,SEFARADI,TEMANI,ETYOPI,FRENCH,MIXED}
enum Smoke{NO,SOMETIMES,TRY_TO_STOP,YES}
enum SherutGirl {ARMY,MECHINA,ONE_YEAR_SHERUT,TWO_YEARS_SHERUT,MIDRASHA,SHLICHUT,GURNISHT}
enum SherutBoy {KRAVI,JOBNIK,MECHINA,HESDER,GVOHA,SHERUT,SHLICHUT,GURNISH}

class Person {
  Gender gender;
  List<String> profileImages;
  String firstName;
  String lastName;
  DateTime birthday;
  String short;
  String long;
  int height;
  Area area;
  Country country;
  Status status;
  Dos dos;
  Hashkafa hashkafa;
  Eda eda;
  Smoke smoke;



  int heightLow;
  int heightHigh;
  int ageLow;
  int ageHigh;
}