import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/providers/shadchanProvider.dart';
import 'package:dating/screens/addPerson.dart';
import 'package:dating/screens/shadchanList.dart';
import 'package:dating/themes/lightTheme.dart';
import 'package:dating/widgets/fABBottomAppBarItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle = new Text('Search Example');
  final TextEditingController _filter = new TextEditingController();
  PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  var currentPageValue = 0.0;
  var currentIndex = 0;
  var selectedIndex = 0;
  bool isInit = true;
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

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: TextStyle(color: Colors.purple),
          controller: _filter,
          autofocus: true,
          decoration: new InputDecoration(
            //border: InputBorder.none,
            //contentPadding: EdgeInsets.all(20),
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.purple[300],
            ),
            prefixIcon: new Icon(
              Icons.search,
              color: Colors.purple,
            ),
            hintText: 'Search Name',
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
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        //filteredNames = names;
        _filter.clear();
      }
    });
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      isInit = false;
      personProvider = Provider.of<PersonProvider>(context);
     personProvider.shadchanProvider.getMyShadchanByID();
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          onPressed: addPersonScreen,
          child: Icon(Icons.person_add),
        ),
        appBar: AppBar(
          // centerTitle: true,
          title: _appBarTitle,
          actions: <Widget>[
            IconButton(
              icon: _searchIcon,
              onPressed: _searchPressed,
            ),
            // IconButton(
            //   icon: Icon(Icons.sort),
            //   onPressed: (){},

            // ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: PageView(
          onPageChanged: (index) {
            setState(() {
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
              child: Everyone(),
              //  color: Colors.cyan,
            ),
            Container(
              color: Colors.deepPurple,
              child: FavoriteList(),
            ),
            Container(
              //  color: Colors.deepPurple,
              child: ChatList(),
            ),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: FABBottomAppBar(
          selectedIndex: selectedIndex,
          centerItemText: 'A',
          color: Colors.grey,
          selectedColor: Colors.white,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          backgroundColor: LightTheme.getTheme().primaryColor,
          items: [
            // FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
            FABBottomAppBarItem(iconData: Icons.people_outline, text: LocaleText.getLocaleText(MyApp.getLocale(), "My list")),
            FABBottomAppBarItem(iconData: Icons.people, text: LocaleText.getLocaleText(MyApp.getLocale(), "Everyone")),
            FABBottomAppBarItem(iconData: Icons.star, text: LocaleText.getLocaleText(MyApp.getLocale(), "Favorites")),
            FABBottomAppBarItem(iconData: Icons.chat, text: LocaleText.getLocaleText(MyApp.getLocale(), "My Chats")),
          ],
        ),
      ),
      //)
    );
  }
}
