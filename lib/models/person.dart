enum Gender { MALE, FEMALE }
enum Area { GUSH_DAN, SHARON, JERUSALEM, BEER_SHEVA, HIFA, CHUL }
enum Country { ISRAEL, AUSTRALIA, BELGIUM, CANADA, UK, USA, SWITZERLAND }
enum Status { SINGLE, ALMAN, GARUSH }
enum Dos { MASORTI, LITE, REGULAR, VERY, DOS }
enum Hashkafa { LEUMI, CHAREDI, CHABAD, BRESLUV, CHOZER_BITSHUVA, JEW }
enum Eda { ASHKENAZI, SEFARADI, TEMANI, ETYOPI, FRENCH, MIXED }
enum Smoke { NO, SOMETIMES, TRY_TO_STOP, YES }
enum SherutGirl { ARMY, MECHINA, ONE_YEAR_SHERUT, TWO_YEARS_SHERUT, MIDRASHA, SHLICHUT, GURNISHT }
enum SherutBoy { KRAVI, JOBNIK, MECHINA, HESDER, GVOHA, SHERUT, SHLICHUT, GURNISH }
enum CompareScore{NOT_KASHUR,MAYBE,YALA}
class Person {
  String id;
  //my info
  Gender gender;
  List<String> profileImages = [];
  String firstName;
  String lastName;
  DateTime birthday;
  String short;
  String long;
  double height;
  Area area;
  Country country;
  Status status;
  Dos dos;
  Hashkafa hashkafa;
  Eda eda;
  Smoke smoke;
  List<SherutBoy> mySherutBoy =new List<SherutBoy> ();
  List<SherutGirl> mySherutGirl =new List<SherutGirl>();
  //looking for info
  List<Area> areas =new List<Area>();
  List<Status> statuses =new List<Status>();
  List<Dos> doses =new List<Dos>();
  List<Hashkafa> hashkafas =new List<Hashkafa>();
  List<Eda> edas =new List<Eda>();
  List<Smoke> smoking =new List<Smoke>();
  List<SherutBoy> thereSherutBoy =new List<SherutBoy>();
  List<SherutGirl> thereSherutGirl = new List<SherutGirl>();
  double heightMin;
  double heightMax;
  double ageMin;
  double ageMax;
  String moreInfo;

  String shadchanID;

  int views;
  int requests;
  int dates;

  bool isVisible;

  Person(
    {
      this.id,
      this.gender,
      this.firstName,
      this.lastName,
      this.birthday,
      this.short,
      this.long,
      this.height,
      this.area,
      this.country,
      this.status,
      this.dos,
      this.hashkafa,
      this.eda,
      this.smoke,
      this.mySherutBoy,
      this.mySherutGirl,
      this.profileImages,
      this.shadchanID,
      this.views,
      this.requests,
      this.dates,
      this.isVisible,
      

      this.areas,
      this.statuses,
      this.doses,
      this.hashkafas,
      this.edas,
      this.smoking,
      this.thereSherutBoy,
      this.thereSherutGirl,
      this.heightMin,
      this.heightMax,
      this.ageMin,
      this.ageMax,
      this.moreInfo,
      
      });
}
