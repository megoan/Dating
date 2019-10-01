import 'package:dating/themes/themeController.dart';
import 'package:flutter/material.dart';

import 'highlightWidget.dart';

class FancyFab extends StatefulWidget {
  final BuildContext context;
  FancyFab({this.context});
  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab> with SingleTickerProviderStateMixin {

  


  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _animateColor;
  //Animation<HighLightedIcon> _animateIcon;
  Curve _curve = Curves.easeOut;
  HighLightedIcon selectedIcon;
  bool set=false;


  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
     ThemeController.switchTheme(context);    
  }

  Widget toggle() {
     _animationController.forward();
    if(Theme.of(context).brightness!=Brightness.light){
      
    _animateColor = ColorTween(
      begin: Color.fromRGBO(16, 0, 38, 1),
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    }
    else{
    
 _animateColor = ColorTween(
      end: Color.fromRGBO(16, 0, 38, 1),
      begin: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    }
    return FloatingActionButton(
      backgroundColor: (Theme.of(context).brightness==Brightness.light)?ColorTween(
      end: Color.fromRGBO(16, 0, 38, 1),
      begin: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    )).value:ColorTween(
      begin: Color.fromRGBO(16, 0, 38, 1),
      end: Colors.white,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    )).value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: (Theme.of(context).brightness!=Brightness.light)? HighLightedIcon(Icons.wb_sunny,color: Theme.of(context).accentColor,):
      HighLightedIcon(Icons.brightness_3,color: Theme.of(context).accentColor,),

    );
  }

  @override
  Widget build(BuildContext context) {
    return toggle();
  }
}