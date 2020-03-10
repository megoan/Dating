import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/screens/addPerson.dart';
import 'package:dating/screens/shadchanList.dart';
import 'package:dating/themes/lightTheme.dart';
import 'package:dating/widgets/fABBottomAppBarItem.dart';
import 'package:dating/widgets/filterDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'chatList.dart';
import 'everyone.dart';
import 'favoritesList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _filter = new TextEditingController();
  PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var currentPageValue = 0.0;
  var currentIndex = 0;
  var selectedIndex = 0;
  bool isInit = true;
  bool searchMode=false;
  PersonProvider personProvider;
  //String _lastSelected = 'TAB: 0';
  void _selectedTab(int index) {
    setState(() {
      selectedIndex = index;
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void addPersonScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new AddPerson())).then((value) {setState(() {
      
    });});
  }



  @override
  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
     personProvider.shadchanProvider.getMyShadchanByID();
    }

    super.didChangeDependencies();
  }
  Widget getEveruone(){
    return Everyone();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          //backgroundColor: Colors.indigo,
          onPressed: addPersonScreen,
          child: Icon(Icons.person_add),
        ),
        appBar: AppBar(
          // centerTitle: true,
          title: searchMode? TextField(
          style: TextStyle(color:Theme.of(context).accentColor),
          controller: _filter,
          autofocus: true,
          onChanged: (value){
            personProvider.updateNameFilter(value);
              setState(() {
                
              });
          },
          decoration: new InputDecoration(
            //border: InputBorder.none,
            //contentPadding: EdgeInsets.all(20),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            prefixIcon: new Icon(
              Icons.search,
              color: Theme.of(context).accentColor,
            ),
            hintText: LocaleText.getLocaleText(MyApp.getLocale(), "Search Name"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            
            //       focusedBorder: OutlineInputBorder(
            // //  borderSide: BorderSide(color: Colors.white),
            //   borderRadius: BorderRadius.circular(30),
            // ),
            // enabledBorder: UnderlineInputBorder(
            // //  borderSide: BorderSide(color: Colors.white),
            //   borderRadius: BorderRadius.circular(30),
            // ),
          ),
        ):Text('Cool Group'),//_appBarTitle,
          actions: <Widget>[
           if(selectedIndex==1) IconButton(
              icon:searchMode? Icon(Icons.close):Icon(Icons.search),
              onPressed:searchMode? (){
                _filter.clear();
                 personProvider.updateNameFilter("");
                 searchMode=false;
              setState(() {
                
              });
              }:
              (){
                 searchMode=true;
                 setState(() {
                   
                 });
              },
            ),
            // IconButton(
            //   icon: Icon(Icons.sort),
            //   onPressed: (){},

            // ),
             if(selectedIndex==1) IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () {
                showDialog(context: context,
                builder: (_) => Dialog(
                  child: FilterDialog(),
                ),
                ).then((value)async{
                   await personProvider.getAllPeople();
                  setState(() {
                  
            });
                });
              },
            ),
          ],
        ),
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              searchMode = false;
              selectedIndex = index;
            });
          },
          controller: controller,
          children: <Widget>[
            Container(
              color: Colors.grey[300],
              child: ShadchanList(),
              //  color: Colors.pink,
            ),
            Container(
              color: Colors.grey[300],
              child: getEveruone(),
              //  color: Colors.cyan,
            ),
            Container(
              color: Colors.grey[300],
              child: FavoriteList(),
            ),
            Container(
              //color: Colors.grey[300],
              //  color: Colors.deepPurple,
              child: ChatList(),
            ),
          ],
        ),
        // drawer: Drawer(
        //   // Add a ListView to the drawer. This ensures the user can scroll
        //   // through the options in the drawer if there isn't enough vertical
        //   // space to fit everything.
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: <Widget>[
        //       DrawerHeader(
        //         child: Text('Drawer Header'),
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //       ),
        //       ListTile(
        //         title: Text('Item 1'),
        //         onTap: () {
        //           // Update the state of the app
        //           // ...
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //       ListTile(
        //         title: Text('Item 2'),
        //         onTap: () {
        //           // Update the state of the app
        //           // ...
        //           // Then close the drawer
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ],
        //   ),
        // ),
        bottomNavigationBar: FABBottomAppBar(
          selectedIndex: selectedIndex,
          centerItemText: 'A',
          color: Colors.grey,
          selectedColor:  Theme.of(context).primaryColor,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          backgroundColor: Colors.white,
          items: [
            // FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
            FABBottomAppBarItem(iconData: Icons.people_outline, text: LocaleText.getLocaleText(MyApp.getLocale(), "My list")),
            FABBottomAppBarItem(iconData: Icons.people, text: LocaleText.getLocaleText(MyApp.getLocale(), "Everyone")),
            FABBottomAppBarItem(iconData: Icons.star, text: LocaleText.getLocaleText(MyApp.getLocale(), "Favorites")),
            FABBottomAppBarItem(iconData: Icons.chat, text: LocaleText.getLocaleText(MyApp.getLocale(), "My Chats")),
          ],//'Search Name'
        ),
      ),
      //)
    );
  }
}
