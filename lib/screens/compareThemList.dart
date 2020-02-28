import 'package:dating/models/person.dart';
import 'package:dating/models/shadchan.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/widgets/compareCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CompareThemList extends StatefulWidget {
  final Person myPerson;
  final Shadchan shadchan;
  CompareThemList(this.myPerson, this.shadchan);
  @override
  _CompareThemListState createState() => _CompareThemListState();
}

class _CompareThemListState extends State<CompareThemList> {
  PersonProvider personProvider;

  bool isLoading = true;
  List<Person> list = [];
  Widget returnCard(Person myPerson,Person person, Shadchan shadchan) {
    return new CompareCard(myPerson,person, shadchan);
  }
  bool myP(Person p){
    return p.shadchanID==personProvider.shadchanProvider.myShadchanId && personProvider.comparePerson.gender!=p.gender;
  }
  bool myF(Person p){
    return personProvider.shadchanProvider.myFavorites.containsKey(p.id) && personProvider.comparePerson.gender!=p.gender;
  }
  bool allP(Person p){
    return personProvider.comparePerson.gender!=p.gender;
  }

  void resetList() async {
    setState(() {
      isLoading = true;
    });
    if (allSelected) {
      list = await personProvider.getAllPeopleQuery(predicate: allP, personComparator: personProvider.myCompare);
      setState(() {
        isLoading = false;
      });
    } else if (myListSelected) {
      list = await personProvider.getAllPeopleQuery(predicate: myP,personComparator: personProvider.myCompare);
      setState(() {
        isLoading = false;
      });
    } else {
      list = await personProvider.getAllPeopleQuery(predicate: myF,personComparator: personProvider.myCompare);
      setState(() {
        isLoading = false;
      });
    }
  }

  bool isInit = true;
  @override
  void didChangeDependencies() async {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
      personProvider.comparePerson = widget.myPerson;
      list = await personProvider.getAllPeopleQuery(predicate: myP);

      setState(() {
        isLoading = false;
      });
    }

    super.didChangeDependencies();
    //getAllPeople()
  }

  List<String> litems = ["1", "2", "Third", "4"];
  bool allSelected = false;
  bool myListSelected = true;
  bool myFavoritesSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:widget.myPerson.profileImages!=null? CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                 widget.myPerson.profileImages[0],
                //fit: BoxFit.fill,
              ),
            ):Container(),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Compare')),
            SizedBox(
              width: 8.0,
            ),
            Text(widget.myPerson.firstName),
          ],
        ),
      ),
      body:isLoading?Center(child:CircularProgressIndicator()): Container(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (myListSelected)
                    RaisedButton(
                        onPressed: () {
                          // setState(() {
                          //      myListSelected=!myListSelected;
                          // });
                        },
                        color: Colors.purple,
                        child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'My list'), style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))),
                  if (!myListSelected)
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          myListSelected = !myListSelected;
                          myFavoritesSelected = false;
                          allSelected = false;
                        });
                         resetList();
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(MyApp.getLocale(), 'My list'),
                              style: TextStyle(color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.purple, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1, //width of the border
                      ),
                    ),
                  if (myFavoritesSelected)
                    RaisedButton(
                        onPressed: () {
                          // setState(() {
                          //    myFavoritesSelected=!myFavoritesSelected;
                          // });
                        },
                        color: Colors.purple,
                        child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Favorites'), style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))),
                  if (!myFavoritesSelected)
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          myFavoritesSelected = !myFavoritesSelected;
                          myListSelected = false;
                          allSelected = false;
                        });
                          resetList();
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(MyApp.getLocale(), 'Favorites'),
                              style: TextStyle(color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.purple, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1, //width of the border
                      ),
                    ),
                  if (allSelected)
                    RaisedButton(
                        onPressed: () {
                          // setState(() {
                          //    allSelected=!allSelected;
                          // });
                        },
                        color: Colors.purple,
                        child: Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Everyone'), style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))),
                  if (!allSelected)
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          allSelected = !allSelected;
                          myFavoritesSelected = false;
                          myListSelected = false;
                        });
                          resetList();
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(MyApp.getLocale(), 'Everyone'),
                              style: TextStyle(color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.purple, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 1, //width of the border
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext ctxt, int index) => Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: returnCard(widget.myPerson,list[index], personProvider.shadchanProvider.allShadchanimMap[list[index].shadchanID]),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
