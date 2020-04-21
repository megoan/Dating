import 'dart:collection';

import 'package:dating/models/person.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  PersonProvider(this.shadchanProvider);
  ShadchanProvider shadchanProvider;
  Person newPerson;
  Person comparePerson;
  List<Person> allPeopleDataBase = [
    Person(
      id: "1",
      gender: Gender.FEMALE,
      firstName: "Esther",
      lastName: "Soy",
      birthday: DateTime(1994, 11, 6),
      short: "I like Horses",
      long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
      height: 1.64,
      area: Area.JERUSALEM,
      country: Country.ISRAEL,
      status: Status.SINGLE,
      dos: Dos.REGULAR,
      hashkafa: Hashkafa.LEUMI,
      eda: Eda.FRENCH,
      smoke: Smoke.SOMETIMES,
      mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
      mySherutGirl: [SherutGirl.ONE_YEAR_SHERUT, SherutGirl.MIDRASHA],
      countrys: [Country.ISRAEL],
      areas: [Area.GUSH_DAN, Area.JERUSALEM],
      statuses: [Status.SINGLE],
      doses: [Dos.REGULAR, Dos.LITE],
      hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
      edas: [Eda.ASHKENAZI, Eda.SEFARADI],
      smoking: [Smoke.YES],
      thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
      thereSherutBoy: [SherutBoy.GVOHA],
      heightMin: 1.50,
      heightMax: 1.70,
      ageMin: 23,
      ageMax: 27,
      moreInfo: "whats up",
      views: 10,
      requests: 13,
      dates: 3,
      isVisible: true,
      profileImages: ["https://cdn.pixabay.com/photo/2018/05/15/07/39/girl-3402351_960_720.jpg","https://cdn.pixabay.com/photo/2015/09/09/20/23/baby-933097_960_720.jpg"],
      shadchanID: "5",
    ),
    Person(
        id: "2",
        gender: Gender.FEMALE,
        firstName: "Bracha",
        lastName: "Soy",
        birthday: DateTime(1991, 11, 17),
        short: "I like History",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 1.64,
        area: Area.GUSH_DAN,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.JEW,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        mySherutGirl: [SherutGirl.TWO_YEARS_SHERUT],
        countrys: [Country.ISRAEL],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.TRY_TO_STOP],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        thereSherutBoy: [SherutBoy.HESDER, SherutBoy.GVOHA],
        heightMin: 1.50,
        heightMax: 1.70,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://cdn.pixabay.com/photo/2015/09/09/20/23/baby-933097_960_720.jpg"],
        shadchanID: "4"),
    Person(
        id: "3",
        gender: Gender.FEMALE,
        firstName: "Lyla",
        lastName: "Soy",
        birthday: DateTime(1996, 11, 17),
        short: "I like Night",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 1.54,
        area: Area.CHUL,
        country: Country.UK,
        status: Status.GARUSH,
        dos: Dos.LITE,
        hashkafa: Hashkafa.CHOZER_BITSHUVA,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        mySherutGirl: [SherutGirl.MIDRASHA, SherutGirl.MECHINA, SherutGirl.ARMY],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        countrys: [Country.ISRAEL],
        statuses: [Status.SINGLE, Status.ALMAN, Status.GARUSH],
        doses: [Dos.REGULAR, Dos.LITE, Dos.MASORTI],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        thereSherutBoy: [SherutBoy.KRAVI, SherutBoy.MECHINA],
        heightMin: 1.50,
        heightMax: 1.70,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://cdn.pixabay.com/photo/2013/11/01/20/23/baby-204185_960_720.jpg"],
        shadchanID: "1"),
    Person(
        id: "4",
        gender: Gender.MALE,
        firstName: "Shmuel",
        lastName: "Soy",
        birthday: DateTime(1993, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 1.74,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        countrys: [Country.ISRAEL],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 1.50,
        heightMax: 1.70,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-roland-1564112798.jpg"],
        shadchanID: "2"),
    Person(
        id: "5",
        gender: Gender.MALE,
        firstName: "Shmuel",
        lastName: "Soy",
        birthday: DateTime(1997, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 1.74,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        countrys: [Country.ISRAEL],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 1.50,
        heightMax: 1.70,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-dewey-1564143216.jpg"],
        shadchanID: "1"),
    Person(
        id: "6",
        gender: Gender.MALE,
        firstName: "Shmil",
        lastName: "Soy",
        birthday: DateTime(1991, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 1.74,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        countrys: [Country.ISRAEL],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 1.50,
        heightMax: 1.70,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 15,
        requests: 7,
        dates: 8,
        isVisible: true,
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],
        shadchanID: "1"),
  ];
  List<Person> allPeople = [];
  List<Person> myPeople = [];
  String nameFilter="";
  
  double ageMax=99;
  double ageMin=18;
  Area pickedArea;
  Country pickedCountry;
  Map<Status,bool> pickedStatus={};
  List<Gender> genders = [];
  List<Country> countrys = [];
  void updateNameFilter(val){

       nameFilter=val;
    notifyListeners();
 
   
  }
  void setMainFilters(double ageMax,double ageMin,List<Gender> genders,List<Country> countrys){
    this.ageMax=ageMax;
    this.ageMin=ageMin;
    this.genders=[];
    for (var gender in genders) {
      this.genders.add(gender);
    }
    this.countrys=[];
    for (var country in countrys) {
      this.countrys.add(country);
    }
    notifyListeners();
  }
  bool mainFilter(Person person) {
    if (ageMax != null) {
      if (ageMax < StaticFunctions.getAge(person.birthday)) {
        return false;
      }
    }
    if (ageMin != null) {
      if (ageMin > StaticFunctions.getAge(person.birthday)) {
        return false;
      }
    }
    if (genders != null && genders.length > 0) {
      if (!genders.contains(person.gender)) {
        return false;
      }
    }
    if (countrys != null && countrys.length > 0) {
      if (!countrys.contains(person.country)) {
        return false;
      }
    }
    return true;
  }

  Future<List<Person>> getAllPeopleQuery({Function predicate, Comparator<Person> personComparator}) {
    List<Person> temp = [];
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        if (mainFilter(person) && (predicate == null || predicate(person))) {
          temp.add(person);
        }
        if (personComparator != null) {
          temp.sort(personComparator);
        }
      }

      return temp;
    });
  }

  Future<bool> getAllPeople() async {
    allPeople = [];
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        if (person.isVisible && mainFilter(person)) {
          allPeople.add(person);
        }
      }
      notifyListeners();
      return true;
    });
  }

  Future<bool> getAllMyPeople() async {
    myPeople = [];
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        if (person.shadchanID == shadchanProvider.myShadchanId) {
          myPeople.add(person);
        }
      }
      notifyListeners();
      return true;
    });
  }

  Future<bool> getAllMyFavorites() async {
    shadchanProvider.myFavoritesList = [];
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        if (shadchanProvider.myFavorites.containsKey(person.id)) {
          shadchanProvider.myFavoritesList.add(person);
        }
      }
      notifyListeners();
      return true;
    });
  }

  void removeFavorite(String id) {
    if (shadchanProvider.myFavorites.containsKey(id)) {
      shadchanProvider.myFavorites.remove(id);
      print(shadchanProvider.myFavoritesList.length.toString());
      shadchanProvider.myFavoritesList.removeWhere((element) => element.id == id);
      print(shadchanProvider.myFavoritesList.length.toString());
      notifyListeners();
    }
  }

  void addFavorite(id) {
    if (!shadchanProvider.myFavorites.containsKey(id)) {
      shadchanProvider.myFavorites[id] = true;
      notifyListeners();
    }
  }

  void switchFavorite(id) {
    if (shadchanProvider.myFavorites.containsKey(id)) {
      shadchanProvider.myFavorites.remove(id);
      shadchanProvider.myFavoritesList.removeWhere((element) => element.id == id);
      notifyListeners();
    } else {
      shadchanProvider.myFavorites[id] = true;

      notifyListeners();
    }
  }

  Future<Person>getPersonById(String id)async{
    return Future.delayed(Duration(milliseconds: 500),(){
      for (var person in allPeople) {
        if (person.id==id) {
          return person;
        }
      }
      return null;
    });
  }

  CompareScore compareScore(Person person) {
    int cpAge = StaticFunctions.getAge(comparePerson.birthday);
    int pAge = StaticFunctions.getAge(person.birthday);

    // NOT KASHUR IFS
    if ((pAge - comparePerson.ageMax >= 3 && person.gender == Gender.FEMALE && cpAge < 50) || (cpAge - person.ageMax >= 3 && comparePerson.gender == Gender.FEMALE && pAge < 50)) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.ageMin - pAge) >= 3 && cpAge < 32) || ((person.ageMin - cpAge) >= 3 && pAge < 32)) {
      return CompareScore.NOT_KASHUR;
    }
    if ((comparePerson.heightMin - person.height > 10) || (person.heightMin - comparePerson.height > 10)) {
      return CompareScore.NOT_KASHUR;
    }
    if ((comparePerson.height - person.heightMax > 10) || (person.height - comparePerson.heightMax > 10)) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.edas.contains(comparePerson.eda) && comparePerson.edas.length == 1) || (person.edas.contains(person.eda) && person.edas.length == 1)) && comparePerson.eda != person.eda) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.hashkafas.contains(comparePerson.hashkafa) && comparePerson.hashkafas.length == 1) || (person.hashkafas.contains(person.hashkafa) && person.hashkafas.length == 1)) &&
        comparePerson.hashkafa != person.hashkafa) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.doses.contains(comparePerson.dos) && comparePerson.doses.length == 1) || (person.doses.contains(person.dos) && person.doses.length == 1)) && comparePerson.dos != person.dos) {
      return CompareScore.NOT_KASHUR;
    }
    if (comparePerson.smoking.length == 1 && comparePerson.smoking[0].index == 0 && person.smoke.index > 1 ||
        person.smoking.length == 1 && person.smoking[0].index == 0 && comparePerson.smoke.index > 1) {
      return CompareScore.NOT_KASHUR;
    }
    //YALLA IFS
    LinkedHashSet aaa = new LinkedHashSet();
    LinkedHashSet bbb = new LinkedHashSet();
    LinkedHashSet aaaaa = new LinkedHashSet();
    LinkedHashSet bbbbb = new LinkedHashSet();

    if (comparePerson.gender == Gender.MALE) {
      for (var item in comparePerson.mySherutBoy) {
        aaa.add(item);
      }
      for (var item in comparePerson.thereSherutGirl) {
        bbb.add(item);
      }
      for (var item in person.mySherutGirl) {
        aaaaa.add(item);
      }
      for (var item in person.thereSherutBoy) {
        bbbbb.add(item);
      }
    } else {
      for (var item in comparePerson.mySherutGirl) {
        aaa.add(item);
      }
      for (var item in comparePerson.thereSherutBoy) {
        bbb.add(item);
      }
      for (var item in person.mySherutBoy) {
        aaaaa.add(item);
      }
      for (var item in person.thereSherutGirl) {
        bbbbb.add(item);
      }
    }
    if ((pAge > comparePerson.ageMin && pAge < comparePerson.ageMax && cpAge > person.ageMin && cpAge < person.ageMax) && // age compare
        (person.height > comparePerson.heightMin && person.height < comparePerson.heightMax && comparePerson.height > person.heightMin && comparePerson.height < person.heightMax) && // height compare
        (person.areas.contains(comparePerson.area) && comparePerson.areas.contains(person.area)) && // area compare

        (person.statuses.contains(comparePerson.status) && comparePerson.statuses.contains(person.status)) && // status compare
        (person.doses.contains(comparePerson.dos) && comparePerson.doses.contains(person.dos)) && // dos compare
        (person.hashkafas.contains(comparePerson.hashkafa) && comparePerson.hashkafas.contains(person.hashkafa)) && // hashkafa compare
        (person.edas.contains(comparePerson.eda) && comparePerson.edas.contains(person.eda)) && // eda compare
        (person.smoking.contains(comparePerson.smoke) && comparePerson.smoking.contains(person.smoke)) && // smoking compare
        aaa.intersection(bbbbb).length > 0 &&
        bbb.intersection(aaaaa).length > 0) {
      return CompareScore.YALA;
    }

    return CompareScore.MAYBE;
  }

  int myCompare(Person person1, Person person2) {
    if (compareScore(person1).index > compareScore(person2).index) {
      return 1;
    } else if (compareScore(person1).index < compareScore(person2).index) {
      return -1;
    } else {
      return 0;
    }
  }

  Future<String> addPerson(Person person) {
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      allPeopleDataBase.add(person);
      notifyListeners();
      return "true";
    });
  }

  Future<bool> updatePerson(Person person) {
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var item in allPeopleDataBase) {
        if (item.id == person.id) {
          item = person;
        }
      }
      notifyListeners();
      return true;
    });
  }

  Future<bool> updateVisible(String id, bool visible) {
    print("dfgdfgdgdfg");
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var item in allPeopleDataBase) {
        if (item.id == id) {
          item.isVisible = visible;
        }
      }
      notifyListeners();
      return true;
    });
  }
}
