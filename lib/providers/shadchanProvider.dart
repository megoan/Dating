import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';
import 'package:flutter/material.dart';

class ShadchanProvider extends ChangeNotifier {

  String myShadchanId="1";
  Shadchan myShadchan;
  Map<String,bool> myFavorites={"3":true,"4":true};
  List<Person> myFavoritesList = [];
  List<Shadchan> allShadchanim = [];
  Map<String, Shadchan> allShadchanimMap = {};
  Future<bool> getAllShadchanim() async {
    if (allShadchanim.length==0) {
         allShadchanim = [];
    allShadchanimMap = {};
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      allShadchanim.add(Shadchan("1", "Shmuel", "052", "a@g.c", "https://cdn.pixabay.com/photo/2015/09/18/11/38/old-woman-945448_960_720.jpg", ["5"], [],true));
      allShadchanim.add(Shadchan("2", "Esther", "052", "a@g.c", "https://cdn.pixabay.com/photo/2015/09/18/11/38/old-woman-945448_960_720.jpg", ["4"], [],false));
      allShadchanim.add(Shadchan("3", "Bracha", "052", "a@g.c", "https://cdn.pixabay.com/photo/2015/09/18/11/38/old-woman-945448_960_720.jpg", ["3"], [],true));
      allShadchanim.add(Shadchan("4", "Yaakov", "052", "a@g.c", "https://cdn.pixabay.com/photo/2015/09/18/11/38/old-woman-945448_960_720.jpg", ["2"], [],true));
      allShadchanim.add(Shadchan("5", "Ephraim", "052", "a@g.c", "https://cdn.pixabay.com/photo/2015/09/18/11/38/old-woman-945448_960_720.jpg", ["1"], [],false));

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
  Future<bool> getMyShadchanByID()async{
    return Future.delayed(Duration(milliseconds: 500)).then((onValue) {
      myShadchan=new Shadchan("1", "shmilo", "222", "aaa@bbb.ccc", "https://cdn.pixabay.com/photo/2015/09/18/11/38/old-woman-945448_960_720.jpg", ["5","6"], ["3","4"], true);
      return true;
    });
  }
    Future<Shadchan>getShadchanByID(String id)async{
    return Future.delayed(Duration(milliseconds: 500),(){
      for (var shadchan in allShadchanim) {
        if (shadchan.id==id) {
          return shadchan;
        }
      }
      return null;
    });
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
