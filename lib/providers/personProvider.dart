import 'package:dating/models/person.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier{
  List<Person> allPeople=[];

  Future<bool>getAllPeople()async{
    allPeople = [];
    return Future.delayed(Duration(milliseconds: 500))
        .then((onValue)  {
          allPeople.add(Person.smallDetails("1","Shmuel",DateTime(1991,11,17),Area.CHUL,"I like Blender",["https://i.pinimg.com/236x/d2/de/95/d2de9556e9eef282d01f208bfb8d5090.jpg"],"5"));
          allPeople.add(Person.smallDetails("2","Esther",DateTime(1994,11,6),Area.GUSH_DAN,"I like horses",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-declan-1564110338.jpg"],"4"));
          allPeople.add(Person.smallDetails("3","Bracha",DateTime(1995,9,11),Area.BEER_SHEVA,"I like History",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg"],"3"));
          allPeople.add(Person.smallDetails("4","Yaakov",DateTime(2000,0,20),Area.JERUSALEM,"I like Rav MM",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-roland-1564112798.jpg"],"2"));
          allPeople.add(Person.smallDetails("5","Ephraim",DateTime(2000,0,20),Area.JERUSALEM,"I like rav MS",["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-dewey-1564143216.jpg"],"1"));
          notifyListeners();
          return true;
          });
  }
}