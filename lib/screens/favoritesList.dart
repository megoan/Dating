import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/widgets/favoritesCard.dart';
import 'package:dating/widgets/personListCard.dart';
import 'package:dating/widgets/personListCard2.dart';
import 'package:dating/widgets/shadchanListCard.dart';
import 'package:dating/widgets/shadchanListCard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class FavoriteList extends StatefulWidget {
  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
    PersonProvider personProvider;

 // ShadchanProvider shadchanProvider;

  bool isInit=true;

  bool isLoading = true;
  reset(){
    setState(() {
      
    });
  }
  @override
  void didChangeDependencies() async{
    if (isInit) {
      isInit=false;
      personProvider = Provider.of<PersonProvider>(context);
      //shadchanProvider = Provider.of<ShadchanProvider>(context);
      await Future.wait([personProvider.getAllMyFavorites(),personProvider.shadchanProvider.getAllShadchanim()]);
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
   
    super.didChangeDependencies();
    //getAllPeople()
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading)?Center(child: CircularProgressIndicator(),) : ListView.builder(
    itemCount:personProvider.shadchanProvider.myFavoritesList.length,
    itemBuilder: (BuildContext ctxt, int index) => returnCard(personProvider.shadchanProvider.myFavoritesList[index],personProvider.shadchanProvider.allShadchanimMap[personProvider.shadchanProvider.myFavoritesList[index].shadchanID]),
  
);
}

  Widget returnCard(Person person,Shadchan shadchan){
    return new FavoritesCard(person,shadchan,reset);
  }
}