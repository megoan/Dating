import 'package:dating/models/person.dart';
import 'package:flutter/material.dart';

class PersonProvider extends ChangeNotifier{
  List<Person> allPeople=[];

  Future<bool>getAllPeople()async{
    allPeople = [];
    return Future.delayed(Duration(milliseconds: 500))
        .then((onValue)  {
          allPeople.add(Person.smallDetails("1","Shmuel",DateTime(1991,11,17),Area.CHUL,"I like Blender"));
          allPeople.add(Person.smallDetails("2","Esther",DateTime(1994,11,6),Area.GUSH_DAN,"I like horses"));
          allPeople.add(Person.smallDetails("3","Bracha",DateTime(1995,9,11),Area.BEER_SHEVA,"I like History"));
          allPeople.add(Person.smallDetails("4","Yaakov",DateTime(2000,0,20),Area.JERUSALEM,"I like Rav MM"));
          allPeople.add(Person.smallDetails("5","Ephraim",DateTime(2000,0,20),Area.JERUSALEM,"I like rav MS"));
          notifyListeners();
          return true;
          });
  }
}