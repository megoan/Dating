enum Gender {MALE,FEMALE}
enum Area {GUSH_DAN,SHARON,JERUSALEM,BEER_SHEVA,HIFA,CHUL}
enum Country{ISRAEL,AUSTRALIA,BELGIUM,CANADA,UK,USA,SWITZERLAND}
enum Status{SINGLE,ALMAN,GARUSH}
enum Dos{MASORTI, LITE, REGULAR,VERY,DOS}
enum Hashkafa{LEUMI,CHAREDI,CHABAD,BRESLUV,CHOZER_BITSHUVA,JEW}
enum Eda {ASHKENAZI,SEFARADI,TEMANI,ETYOPI,FRENCH,MIXED}
enum Smoke{NO,SOMETIMES,TRY_TO_STOP,YES}
enum SherutGirl {ARMY,MECHINA,ONE_YEAR_SHERUT,TWO_YEARS_SHERUT,MIDRASHA,SHLICHUT,GURNISHT}
enum SherutBoy {KRAVI,JOBNIK,MECHINA,HESDER,GVOHA,SHERUT,SHLICHUT,GURNISH}

class Person {
  String id;
  //my info
  Gender gender;
  List<String> profileImages=[];
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
  List<SherutBoy> mySherutBoy=[];
  List<SherutBoy> mySherutGirl=[];
  //looking for info
  List<Area>areas=[];
  List<Status>statuses=[];
  List<Dos>doses=[];
  List<Hashkafa>hashkafas=[];
  List<Eda>edas=[];
  List<Smoke>smoking=[];
  List<SherutBoy>thereSherutBoy=[];
  List<SherutGirl>thereSherutGirl=[];
  int heightMin;
  int heightMax;
  int ageMin;
  int ageMax;
  String moreInfo;

  String shadchanID;

  int views;
  int requests;
  int dates;

  bool isVisible;

  Person.smallDetails(
    this.id,
    this.firstName,
    this.birthday,
    this.area,
    this.short,
    this.profileImages,
    this.shadchanID
    );
}