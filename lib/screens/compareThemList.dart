import 'package:dating/providers/langText.dart';
import 'package:dating/widgets/compareCard.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class CompareThemList extends StatefulWidget {
  @override
  _CompareThemListState createState() => _CompareThemListState();
}

class _CompareThemListState extends State<CompareThemList> {
  Widget returnCard(BuildContext ctxt, int index) {
    return new CompareCard();
  }

  List<String> litems = ["1", "2", "Third", "4"];
  bool allSelected = true;
  bool myListSelected = false;
  bool myFavoritesSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://placeimg.com/640/480/any',
                //fit: BoxFit.fill,
              ),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(LocaleText.getLocaleText(MyApp.getLocale(), 'Compare')),
            SizedBox(
              width: 8.0,
            ),
            Text("אחאמדושי"),
          ],
        ),
      ),
      body: Container(
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
                        child: Text(
                            LocaleText.getLocaleText(
                                MyApp.getLocale(), 'My list'),
                            style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  if (!myListSelected)
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          myListSelected = !myListSelected;
                          myFavoritesSelected = false;
                          allSelected = false;
                        });
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(
                                  MyApp.getLocale(), 'My list'),
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
                        child: Text(
                            LocaleText.getLocaleText(
                                MyApp.getLocale(), 'Favorites'),
                            style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  if (!myFavoritesSelected)
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          myFavoritesSelected = !myFavoritesSelected;
                          myListSelected = false;
                          allSelected = false;
                        });
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(
                                  MyApp.getLocale(), 'Favorites'),
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
                        child: Text(
                            LocaleText.getLocaleText(
                                MyApp.getLocale(), 'Everyone'),
                            style: TextStyle(color: Colors.white)),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0))),
                  if (!allSelected)
                    OutlineButton(
                      onPressed: () {
                        setState(() {
                          allSelected = !allSelected;
                          myFavoritesSelected = false;
                          myListSelected = false;
                        });
                      },
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleText.getLocaleText(
                                  MyApp.getLocale(), 'Everyone'),
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
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int index) => Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: returnCard(ctxt, index),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
