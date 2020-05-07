import 'package:animations/animations.dart';
import 'package:dating/providers/langText.dart';
import 'package:dating/providers/personProvider.dart';
import 'package:dating/screens/addPerson.dart';
import 'package:dating/screens/shadchanList.dart';
import 'package:dating/themes/colorManager.dart';
import 'package:dating/themes/lightTheme.dart';
import 'package:dating/widgets/fABBottomAppBarItem.dart';
import 'package:dating/widgets/filterPage.dart';
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
  bool searchMode = true;
  PersonProvider personProvider;
  ContainerTransitionType _transitionType = ContainerTransitionType.fadeThrough;
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
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new AddPerson())).then((value) {
      setState(() {});
    });
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

  Widget getEveruone() {
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
        appBar: selectedIndex == 1
            ? AppBar(
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                title: _OpenContainerWrapper(
                    transitionType: _transitionType,
                    closedBuilder: (BuildContext _, VoidCallback openContainer) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                        color: ColorManager().theme.filterBackgroundColor,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: ColorManager().theme.textColor),
                                controller: _filter,
                                autofocus: true,
                                onChanged: (value) {
                                  personProvider.updateNameFilter(value);
                                  setState(() {});
                                },
                                decoration: new InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(color: ColorManager().theme.primary, width: 1),
                                  ),
                                  hintStyle: TextStyle(color: ColorManager().theme.primary[300]),
                                  prefixIcon: new Icon(
                                    Icons.search,
                                    color: ColorManager().theme.textColor,
                                  ),
                                  hintText: LocaleText.getLocaleText(MyApp.getLocale(), "Search Name"),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.filter_list,
                                  color: ColorManager().theme.textColor,
                                ),
                                onPressed: () => openContainer()),
                          ],
                        ),
                      );
                    }),
              )
            : AppBar(
                // centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.ac_unit,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        MyApp.setTheme(context);
                      })
                ],
                title: Text('Cool Group'),
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
              // color: Colors.blueGrey[800],
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
          selectedColor: Theme.of(context).primaryColor,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          backgroundColor: Colors.white,
          items: [
            // FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
            FABBottomAppBarItem(iconData: Icons.people_outline, text: LocaleText.getLocaleText(MyApp.getLocale(), "My list")),
            FABBottomAppBarItem(iconData: Icons.people, text: LocaleText.getLocaleText(MyApp.getLocale(), "Everyone")),
            FABBottomAppBarItem(iconData: Icons.star, text: LocaleText.getLocaleText(MyApp.getLocale(), "Favorites")),
            FABBottomAppBarItem(iconData: Icons.chat, text: LocaleText.getLocaleText(MyApp.getLocale(), "My Chats")),
          ], //'Search Name'
        ),
      ),
      //)
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return EveryBodyFilter();
      },
      tappable: false,
      closedBuilder: closedBuilder,
    );
  }
}
