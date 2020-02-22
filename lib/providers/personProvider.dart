import 'package:dating/models/person.dart';
import 'package:dating/providers/generalProvider.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  PersonProvider(this.shadchanProvider);
  ShadchanProvider shadchanProvider;
  List<Person> allPeopleDataBase = [
    Person(
        id: "1",
        gender: Gender.MALE,
        firstName: "Shmuel",
        lastName: "Soy",
        birthday: DateTime(1991, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 174,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 150,
        heightMax: 170,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://i.pinimg.com/236x/d2/de/95/d2de9556e9eef282d01f208bfb8d5090.jpg"],
        shadchanID: "5",
        
        ),
    Person(
        id: "2",
        gender: Gender.MALE,
        firstName: "Shmuel",
        lastName: "Soy",
        birthday: DateTime(1991, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 174,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 150,
        heightMax: 170,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],
        shadchanID: "4"),
    Person(
        id: "3",
        gender: Gender.MALE,
        firstName: "Shmuel",
        lastName: "Soy",
        birthday: DateTime(1991, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 174,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 150,
        heightMax: 170,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],
        shadchanID: "3"),
    Person(
        id: "4",
        gender: Gender.MALE,
        firstName: "Shmuel",
        lastName: "Soy",
        birthday: DateTime(1991, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 174,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 150,
        heightMax: 170,
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
        birthday: DateTime(1991, 11, 17),
        short: "I like Blender",
        long: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lobortis feugiat vivamus at augue eget arcu dictum. ",
        height: 174,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 150,
        heightMax: 170,
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
        height: 174,
        area: Area.CHUL,
        country: Country.ISRAEL,
        status: Status.SINGLE,
        dos: Dos.REGULAR,
        hashkafa: Hashkafa.CHABAD,
        eda: Eda.FRENCH,
        smoke: Smoke.TRY_TO_STOP,
        mySherutBoy: [SherutBoy.HESDER, SherutBoy.JOBNIK],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        heightMin: 150,
        heightMax: 170,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 15,
        requests: 7,
        dates: 8,
        isVisible: true,
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-dewey-1564143216.jpg"],
        shadchanID: "1"),

    // Person.smallDetails("2","Esther",DateTime(1994,11,6),Area.GUSH_DAN,"I like horses",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-declan-1564110338.jpg"],"4"),
    // Person.smallDetails("3","Bracha",DateTime(1995,9,11),Area.BEER_SHEVA,"I like History",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],"3"),
    // Person.smallDetails("4","Yaakov",DateTime(2000,0,20),Area.JERUSALEM,"I like Rav MM",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-roland-1564112798.jpg"],"2"),
    // Person.smallDetails("5","Ephraim",DateTime(2000,0,20),Area.JERUSALEM,"I like rav MS",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-dewey-1564143216.jpg"],"1"),
  ];
  List<Person> allPeople = [];
  List<Person> myPeople = [];
  
  Future<bool> getAllPeople() async {
    allPeople = [];
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        allPeople.add(person);
      }
      notifyListeners();
      return true;
    });
  }

  Future<bool> getAllMyPeople() async {
    myPeople = [];
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        if (person.shadchanID==shadchanProvider.myShadchanId) {
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

  void removeFavorite(String id){
    if (shadchanProvider.myFavorites.containsKey(id)) {
      shadchanProvider.myFavorites.remove(id);
      print(shadchanProvider.myFavoritesList.length.toString());
      shadchanProvider.myFavoritesList.removeWhere((element) => element.id==id);
      print(shadchanProvider.myFavoritesList.length.toString());
      notifyListeners();
    }
  }

  void addFavorite(id){
    if (!shadchanProvider.myFavorites.containsKey(id)) {
      shadchanProvider.myFavorites[id]=true;
      notifyListeners();
    }
  }

  void switchFavorite(id){
      if (shadchanProvider.myFavorites.containsKey(id)) {
      shadchanProvider.myFavorites.remove(id);
      shadchanProvider.myFavoritesList.removeWhere((element) => element.id==id);
      notifyListeners();
    }
    else{
       shadchanProvider.myFavorites[id]=true;
     
      notifyListeners();
    }
  }
}
