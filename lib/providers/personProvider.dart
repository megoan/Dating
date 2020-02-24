import 'dart:collection';

import 'package:dating/models/person.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/providers/staticFunctions.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier {
  PersonProvider(this.shadchanProvider);
  ShadchanProvider shadchanProvider;

  Person comparePerson;
  List<Person> allPeopleDataBase = [
    Person(
        id: "1",
        gender: Gender.FEMALE,
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
        mySherutGirl: [SherutGirl.GURNISHT],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        thereSherutBoy: [SherutBoy.GVOHA],
        heightMin: 150,
        heightMax: 170,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://cdn.pixabay.com/photo/2018/05/15/07/39/girl-3402351_960_720.jpg"],
        shadchanID: "5",
        
        ),
    Person(
        id: "2",
        gender: Gender.FEMALE,
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
        mySherutGirl: [SherutGirl.MECHINA],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        thereSherutBoy: [SherutBoy.HESDER],
        heightMin: 150,
        heightMax: 170,
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
        mySherutGirl: [SherutGirl.MIDRASHA],
        areas: [Area.GUSH_DAN, Area.JERUSALEM],
        statuses: [Status.SINGLE],
        doses: [Dos.REGULAR, Dos.LITE],
        hashkafas: [Hashkafa.CHOZER_BITSHUVA, Hashkafa.CHABAD],
        edas: [Eda.ASHKENAZI, Eda.SEFARADI],
        smoking: [Smoke.YES],
        thereSherutGirl: [SherutGirl.MECHINA, SherutGirl.MIDRASHA, SherutGirl.SHLICHUT],
        thereSherutBoy: [SherutBoy.KRAVI],
        heightMin: 150,
        heightMax: 170,
        ageMin: 23,
        ageMax: 27,
        moreInfo: "whats up",
        views: 10,
        requests: 13,
        dates: 3,
        isVisible: true,
        profileImages: ["https://cdn.pixabay.com/photo/2013/11/01/20/23/baby-204185_960_720.jpg"],
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
        profileImages: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],
        shadchanID: "1"),

    // Person.smallDetails("2","Esther",DateTime(1994,11,6),Area.GUSH_DAN,"I like horses",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-declan-1564110338.jpg"],"4"),
    // Person.smallDetails("3","Bracha",DateTime(1995,9,11),Area.BEER_SHEVA,"I like History",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],"3"),
    // Person.smallDetails("4","Yaakov",DateTime(2000,0,20),Area.JERUSALEM,"I like Rav MM",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-roland-1564112798.jpg"],"2"),
    // Person.smallDetails("5","Ephraim",DateTime(2000,0,20),Area.JERUSALEM,"I like rav MS",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-dewey-1564143216.jpg"],"1"),
  ];
  List<Person> allPeople = [];
  List<Person> myPeople = [];
  Future<List<Person>> getAllPeopleQuery({Function predicate,Comparator<Person> personComparator}){
    List<Person> temp=[];
       return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      for (var person in allPeopleDataBase) {
        if (predicate==null || predicate(person)) {
           temp.add(person);
        }
        if (personComparator!=null) {
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

  CompareScore compareScore(Person person){
    int cpAge= StaticFunctions.getAge(comparePerson.birthday);
    int pAge= StaticFunctions.getAge(person.birthday);

    // NOT KASHUR IFS
    if ((pAge-comparePerson.ageMax>=3 && person.gender==Gender.FEMALE && cpAge<50) || (cpAge-person.ageMax>=3 && comparePerson.gender==Gender.FEMALE && pAge <50)) {
      return CompareScore.NOT_KASHUR;
    }
    if(((comparePerson.ageMin-pAge)>=3 && cpAge<32) || ((person.ageMin-cpAge)>=3 && pAge<32)){
       return CompareScore.NOT_KASHUR;
    }
    if ((comparePerson.heightMin-person.height>10) || (person.heightMin-comparePerson.height>10)) {
      return CompareScore.NOT_KASHUR;
    }
    if ((comparePerson.height-person.heightMax>10) || (person.height-comparePerson.heightMax>10)) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.edas.contains(comparePerson.eda) && comparePerson.edas.length==1) ||(person.edas.contains(person.eda) && person.edas.length==1) ) && comparePerson.eda!=person.eda) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.hashkafas.contains(comparePerson.hashkafa) && comparePerson.hashkafas.length==1) ||(person.hashkafas.contains(person.hashkafa) && person.hashkafas.length==1) ) && comparePerson.hashkafa!=person.hashkafa) {
      return CompareScore.NOT_KASHUR;
    }
    if (((comparePerson.doses.contains(comparePerson.dos) && comparePerson.doses.length==1) ||(person.doses.contains(person.dos) && person.doses.length==1) ) && comparePerson.dos!=person.dos) {
      return CompareScore.NOT_KASHUR;
    }
    if (comparePerson.smoking.length==1 && comparePerson.smoking[0].index==0 && person.smoke.index>1 || person.smoking.length==1 && person.smoking[0].index==0 && comparePerson.smoke.index>1) {
       return CompareScore.NOT_KASHUR;
    }
    //YALLA IFS
    List a=[];
    LinkedHashSet aaa=new LinkedHashSet();
    List b=[];
    LinkedHashSet bbb=new LinkedHashSet();


    List aa=[];
    LinkedHashSet aaaaa=new LinkedHashSet();
    List bb=[];
    LinkedHashSet bbbbb=new LinkedHashSet();

    if (comparePerson.gender==Gender.MALE) {
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
    
    }
    else{
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
    if ((pAge>comparePerson.ageMin && pAge<comparePerson.ageMax && cpAge>person.ageMin && cpAge<person.ageMax) && // age compare
      (person.height>comparePerson.heightMin && person.height<comparePerson.heightMax && comparePerson.height>person.heightMin && comparePerson.height<person.heightMax) && // height compare
      (person.areas.contains(comparePerson.area) && comparePerson.areas.contains(person.area)) && // area compare

      (person.statuses.contains(comparePerson.status) && comparePerson.statuses.contains(person.status)) && // status compare
      (person.doses.contains(comparePerson.dos) && comparePerson.doses.contains(person.dos)) && // dos compare
      (person.hashkafas.contains(comparePerson.hashkafa) && comparePerson.hashkafas.contains(person.hashkafa)) && // hashkafa compare
      (person.edas.contains(comparePerson.eda) && comparePerson.edas.contains(person.eda)) && // eda compare
      (person.smoking.contains(comparePerson.smoke) && comparePerson.smoking.contains(person.smoke)) && // smoking compare
       aaa.intersection(bbbbb).length>0 && bbb.intersection(aaaaa).length>0 ) {
       return CompareScore.YALA;
    }

    return CompareScore.MAYBE;


  }



  int myCompare(Person person1,Person person2){
    if (compareScore(person1).index>compareScore(person2).index) {
      return 1;
    }
    else if (compareScore(person1).index<compareScore(person2).index) {
      return -1;
    }
    else{
       return 0;
    }
   
  }
}
