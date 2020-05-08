

class LocaleText {


  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Boy':'Boy',
      'Girl':'Girl',
      'Him':'Him',
      'Her':'Her',
      'Like':'Like',
      'Get Started':'Get Started',
      'name': 'name',
      'email':'email',
      'Your picture': 'Your picture',
      'My list':'My list',
      'Everyone':'Everyone',
      'Favorites':'Favorites',
      'My Chats':'My Chats',
      'viewes':'viewes',
      'requests':'Requests',
      'dates':'Dates',
      'Compare':'Compare',
      'Compare To':'Compare To',
      'Contacted me about':'Contacted me about',
      'Required fields':'Required fields',
      'Male':'Male',
      'Female':'Female',
      'First name':'First name',
      'Last name':'Last name',
      'Date of Birth':'Date of Birth',
      'Area':'Area',

      'Status':'Status',
      'Religious':'Religious',
      'Hashkafa':'Hashkafa',
      'Eda':'Eda',
      'Smoking':'Smoking',
      'About them short':'About them short',
      'About them long':'About them long',
      'Height':'Height',
      'First name is required':'First name is required',
      'Last name is required':'Last name is required',
      'Date of Birth is required':'Date of Birth is required',
      'Area is required':'Area is required',
      'Status is required':'Status is required',
      'Religious is required':'Religious is required',
      'Hashkafa is required':'Hashkafa is required',
      'Eda is required':'Eda is required',
      'Smoking is required':'Smoking is required',
      'About them short is required':'About them short is required',
      'About them long is required':'About them long is required',
      'Height is required':'Height is required',
      'Not a valid date':'Not a valid date',
      'Add at least one image!':'Add at least one image!',
      'What are they looking for?':'What are they looking for?',
       'What are she looking for?':'What are she looking for?',
      'What are he looking for?':'What are he looking for?',
      'More info':'More info',
      'Sherut':'Sherut',
      'This field is required':'This field is required',
      'choose date':'choose date',
      'Plony':'Plony',
      'Almony':'Almony',
      'm':'m',
      'Please enter a valid date':'Please enter a valid date',
      'Add a candidate':'Add a candidate',
      'Form is not valid!  Please review and correct!':'Form is not valid!  Please review and correct!',
      'Age':'Age',
      'Who am I':'Who am I',
      'What am I looking for':'What am I looking for',
      'Search Name':'Search Name',
      'Country':'Country',
      
    },
    'he': {
      'Boy':'בן',
      'Girl':'בת',
      'Him':'הוא',
      'Her':'היא',
      'name': 'שם',
      'Like':'רוצה',
      'email':'אימייל',
      'Your picture': 'התמונה שלך',
      'Get Started':'התחל',
      'My list':'שלי',
      'Everyone':'כולם',
      'Favorites':'מועדפים',
      'My Chats':"צ'אט",
      'viewes':'צפיות',
      'requests':'בקשות',
      'dates':'פגישות',
      'Compare':'השווה',
      'Compare To':'השווה ל',
      'Contacted me about':'יצר איתי קשר על',
      'Required fields':'שדות חובה',
      'Male':'זכר',
      'Female':'נקבה',
      'First name':'שם פרטי',
      'Last name':'שם משפחה',
      'Date of Birth':'תאריך לידה',
      'Area':'אזור',
      'Sherut':'שירות',
      'm':"מ'",
      'Status':'סטטוט',
      'Religious':'רמה דתית',
      'Hashkafa':'השקפה',
      'Eda':'עדה',
      'Smoking':'עישון',
      'About them short':'על המועמד במשפט',
      'About them long':'על המועמד ארוך',
      'Height':'גובה',

      'First name is required':'נדרש שם פרטי',
      'Last name is required':'נדרש שם משפחה',
      'Date of Birth is required':'נדרש תאריך לידה',
      'Area is required':'נדרש איזור',
      'Status is required':'נדרש סטטוס',
      'Religious is required':'נדרש רמה דתית',
      'Hashkafa is required':'נדרש השקפה',
      'Eda is required':'נדרש עדה',
      'Smoking is required':'נדרש עישון',
      'About them short is required':'About them short is required',
      'About them long is required':'About them long is required',
      'Height is required':'Height is required',
      'Not a valid date':'תאריך לא חוקי',
      'Add at least one image!':'צריך לפחות תמונה אחת',
      'What are they looking for?':'מה הם מחפשים?',
      'What are she looking for?':'מה היא מחפשת?',
      'What are he looking for?':'מה הוא מחפש?',
      'More info':'מידע נוסף',
      'This field is required':'זהו שדה חובה',
      'Add a candidate':'הוסף מועמד',
      'Plony':'פלוני',
      'Almony':'אלמוני',
      'Please enter a valid date':'מעל גיל 18...',
      'Form is not valid!  Please review and correct!':'הטופס אינו תקף! אנא עיין ותקן. ',
      'choose date':'בחר תאריך',
      'Age':'גיל',
      'Who am I':'מי אני',
      'What am I looking for':'מי אני מחפש',
      'Status':'סטטוס',
      'Hashkafa':'השקפה',
      'Height':'גובה',
      'Smoking':'עישון',
      'Eda':'עדה',
      'Search Name':'חפש שם',
      'Country':'ארץ'
    },
  };

  static String getLocaleText(languageCode,text) {
    if (_localizedValues[languageCode][text]!=null)
    return _localizedValues[languageCode][text];
    else
    return text;
  }


  static Map<String, Map<String, Map<String, String>>> _localizedSelectedValues = {
    'en': {
      'Country':{
        'ISRAEL':"Israel",
        'AUSTRALIA':'Australia',
        'CANADA':'Canada',
        'BELGIUM':'Belgium',
        'UK':'UK',
        'USA':'USA',
        'SWITZERLAND':'Switzerland'
      },
      'Area':{
        'BEER_SHEVA':"Be'er Sheva",
        'CHUL'      :'chul',
        'GUSH_DAN'  :'Gush Dan',
        'HIFA'      :'Haifa',
        'JERUSALEM' :'Jerusalem',
        'SHARON'    :'Sharon'
      },
      'Status':{
        'SINGLE':'Single',
        'ALMAN': 'Widow',
        'GARUSH':'Divorced'
      },
      'Dos':{
        'MASORTI':'Masorati',
        'LITE':'lite',
        'REGULAR':'regular',
        'VERY':'very',
        'DOS':'Dos'
      },
      'Hashkafa':{
        'LEUMI':  'Leumi',
        'CHAREDI':'Charedi',
        'CHABAD': 'Chabas',
        'BRESLUV':'Breslav',
        'CHOZER_BITSHUVA':'Chozer Bitshuva',
        'JEW':'Jew'
      },
      'Eda':{
        'ASHKENAZI':'Ashkenazi',
        'SEFARADI':'Sefaradi',
        'TEMANI':'Temani',
        'ETYOPI':'Etyopi',
        'FRENCH':'French',
        'MIXED':'Mixed',
      },
      'Smoke':{
        'NO':'no',
        'SOMETIMES':'Sometimes',
        'TRY_TO_STOP':'Try to stop',
        'YES':'yes',

      },
      'SherutGirl':{
        "ARMY":   "Army",
        "MECHINA":"Mechina",
        "ONE_YEAR_SHERUT": "One Year Sherut",
        "TWO_YEARS_SHERUT":"Two Years Sherut",
        "MIDRASHA":"Midrasha",
        "SHLICHUT":"Shlichut",
        "GURNISHT":"Other"

      },
      'SherutBoy':{
        "KRAVI":   "Kravi",
        "JOBNIK":  "Jobnik",
        "MECHINA": "Mechina",
        "HESDER":  "Hesder Yeshiva",
        "GVOHA":   "Yeshiva Gvoha",
        "SHERUT":  "Sherut",
        "SHLICHUT":"Shlichut",
        "GURNISH": "Other"
      },
      'CompareScore':{
        "NOT_KASHUR":"No way",
        "MAYBE":     "Could be",
        "YALA":      "Do it",

      }
    },
    'he': {
        'Country':{
        'ISRAEL':'ישראל',
        'AUSTRALIA':'אוסטרליה',
        'CANADA':'קנדה',
        'BELGIUM':'בלגיה',
        'UK':'אנגליה',
        'USA':'ארצות הברית',
        'SWITZERLAND':'שוייץ'
        
      },
      'Area':{
        'BEER_SHEVA':'באר שבע והדרום',
        'CHUL':'חו"ל',
        'GUSH_DAN':'גוש דן',
        'HIFA':'חיפה והצפון',
        'JERUSALEM':'ירושלים והסביבה',
        'SHARON':'השרון'
      },
      'Status':{
        'SINGLE':'רווק/ה',
        'ALMAN': 'אלמנ/ה',
        'GARUSH':'גרוש/ה'
      },
      'Dos':{
        'MASORTI':'מסורתי',
        'LITE':   'לייט',
        'REGULAR':'רגיל',
        'VERY':   'מאוד',
        'DOS':    'דוס'
      },
      'Hashkafa':{
        'LEUMI':  'לאומי',
        'CHAREDI':'חרדי',
        'CHABAD': 'חבד',
        'BRESLUV':'ברסלב',
        'CHOZER_BITSHUVA':'חוזר בתשובה',
        'JEW':'יהודי'
      },
      'Eda':{
        'ASHKENAZI':'אשכנז',
        'SEFARADI': 'ספרדי',
        'TEMANI':   'תמני',
        'ETYOPI':   'אתיופי',
        'FRENCH':   'צרפתי',
        'MIXED':    'מעורב',
      },
      'Smoke':{
        'NO':'לא',
        'SOMETIMES':'לפעמים',
        'TRY_TO_STOP':'מנסה להפסיק',
        'YES':'כן',

      },
      'SherutGirl':{
        "ARMY":            "צבא",
        "MECHINA":         "מכינה",
        "ONE_YEAR_SHERUT": "שנה שירות",
        "TWO_YEARS_SHERUT":"שנתים שירות",
        "MIDRASHA":        "מדרשה",
        "SHLICHUT":        "שליחות",
        "GURNISHT":        "אחר"

      },
      'SherutBoy':{
        "KRAVI":   "קרבי",
        "JOBNIK":  "ג'וב",
        "MECHINA": "מכינה",
        "HESDER":  "ישיבת הסדר",
        "GVOHA":   "ישיבה גבוהה",
        "SHERUT":  "שירות",
        "SHLICHUT":"שליחות",
        "GURNISH": "אחר"
      },
      'CompareScore':{
        "NOT_KASHUR":"לא קשור",
        "MAYBE":     "יכול להיות",
        "YALA":      "יאלה",

      }
    },

  };
    static String getLocaleSelectText(languageCode,String select,{String text}) {
      String _select= select;
      String _text= text;
      if(text==null)
      {
        _select = select.split('.').first; 
        _text = select.split('.').last;
      }

    if (_localizedSelectedValues[languageCode][_select]!=null&&_localizedSelectedValues[languageCode][_select][_text]!=null)
    return _localizedSelectedValues[languageCode][_select][_text];
    else
    return text;
  }
}