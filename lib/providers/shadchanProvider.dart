import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';
import 'package:flutter/material.dart';

class ShadchanProvider extends ChangeNotifier {

  String myShadchanId="1";
  Map<String,bool> myFavorites={"3":true,"4":true};
  List<Person> myFavoritesList = [];
  List<Shadchan> allShadchanim = [];
  Map<String, Shadchan> allShadchanimMap = {};
  Future<bool> getAllShadchanim() async {
    if (allShadchanim.length==0) {
         allShadchanim = [];
    allShadchanimMap = {};
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      allShadchanim.add(Shadchan("1", "Shmuel", "052", "a@g.c", "https://i.pinimg.com/236x/d2/de/95/d2de9556e9eef282d01f208bfb8d5090.jpg", ["5"], [],true));
      allShadchanim.add(Shadchan("2", "Esther", "052", "a@g.c", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-declan-1564110338.jpg", ["4"], [],false));
      allShadchanim.add(Shadchan("3", "Bracha", "052", "a@g.c", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-wells-1564112074.jpg", ["3"], [],true));
      allShadchanim.add(Shadchan("4", "Yaakov", "052", "a@g.c", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-roland-1564112798.jpg", ["2"], [],true));
      allShadchanim.add(Shadchan("5", "Ephraim", "052", "a@g.c", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/unique-boy-names-dewey-1564143216.jpg", ["1"], [],false));

      for (var shadchan in allShadchanim) {
        allShadchanimMap[shadchan.id] = shadchan;
      }

      notifyListeners();
      return true;
    });
    }
    else{
      return true;
    }
 
  }

  void removeFavorite(String id){
    if (myFavorites.containsKey(id)) {
      myFavorites.remove(id);
      print(myFavoritesList.length.toString());
      myFavoritesList.removeWhere((element) => element.id==id);
      print(myFavoritesList.length.toString());
      notifyListeners();
    }
  }

  void addFavorite(id){
    if (!myFavorites.containsKey(id)) {
      myFavorites[id]=true;
      notifyListeners();
    }
  }

  void switchFavorite(id){
      if (myFavorites.containsKey(id)) {
      myFavorites.remove(id);
      myFavoritesList.removeWhere((element) => element.id==id);
      notifyListeners();
    }
    else{
       myFavorites[id]=true;
     
      notifyListeners();
    }
  }
}
