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
  Gender gender = Gender.FEMALE;
  List<String> profileImages = [];
  String firstName;
  String lastName;
  DateTime birthday;
  String short;
  String long;
  String phone;
  double height=1.5;
  Area area;
  Country country=Country.ISRAEL;
  Status status;
  Dos dos;
  Hashkafa hashkafa;
  Eda eda;
  Smoke smoke;
  Map<SherutBoy,bool> mySherutBoy = new Map<SherutBoy,bool> ();
  Map<SherutGirl,bool> mySherutGirl = new Map<SherutGirl,bool> ();
  // List<SherutBoy> mySherutBoy = new List<SherutBoy> ();
  // List<SherutGirl> mySherutGirl = new List<SherutGirl>();
  //------looking for info-----------------
  Map<Area,bool>    areas =     new Map<Area,bool> ();
  Map<Country,bool> countrys =  new Map<Country,bool> ();
  Map<Status,bool>  statuses =  new Map<Status,bool> ();
  Map<Dos,bool>     doses =     new Map<Dos,bool> ();
  Map<Hashkafa,bool>hashkafas = new Map<Hashkafa,bool> ();
  Map<Eda,bool>     edas =      new Map<Eda,bool> ();
  Map<Smoke,bool>   smoking =   new Map<Smoke,bool> ();
  // List<Area>     areas =new List<Area>();
  // List<Country>  countrys=new List<Country>();
  // List<Status>   statuses =new List<Status>();
  // List<Dos>      doses =new List<Dos>();
  // List<Hashkafa> hashkafas =new List<Hashkafa>();
  // List<Eda>      edas =new List<Eda>();
  // List<Smoke>    smoking =new List<Smoke>();
  // List<SherutBoy> thereSherutBoy =new List<SherutBoy>();
  // List<SherutGirl> thereSherutGirl = new List<SherutGirl>();
  Map<SherutBoy,bool> thereSherutBoy = new Map<SherutBoy,bool> ();
  Map<SherutGirl,bool> thereSherutGirl = new Map<SherutGirl,bool> ();
  double heightMin= 1.4;
  double heightMax = 1.85;
  double ageMin = 18;
  double ageMax = 99;
  String moreInfo;

  String shadchanID;

  int views=0;
  int requests=0;
  int dates=0;

  bool isVisible=true;

  Person(
    {
      this.id,
      this.gender=Gender.FEMALE,
      this.firstName="",
      this.lastName="",
      this.birthday,
      this.short="",
      this.long="",
      this.height=1.5,
      this.area,
      this.country=Country.ISRAEL,
      this.status,
      this.dos,
      this.hashkafa,
      this.eda,
      this.phone,
      this.smoke,
      this.mySherutBoy,
      this.mySherutGirl,
      this.profileImages,
      this.shadchanID,
      this.views=0,
      this.requests=0,
      this.dates=0,
      this.isVisible=true,
      
      this.countrys,
      this.areas,
      this.statuses,
      this.doses,
      this.hashkafas,
      this.edas,
      this.smoking,
      this.thereSherutBoy,
      this.thereSherutGirl,
      this.heightMin=1.4,
      this.heightMax=1.85,
      this.ageMin=18,
      this.ageMax=99,
      this.moreInfo="",
      
      });
      
}
