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
  void didChangeDependencies() {
    if(!set){
      if(Theme.of(context).brightness==Brightness.light){
        isOpened= false;
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
        isOpened =true;
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
      set=true;
    }
   
    super.didChangeDependencies();
  }

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
    
    if (!isOpened) {
    
      _animationController.forward();

    } else {
     
      _animationController.reverse();
    }
     ThemeController.switchTheme(context);
   
    setState(() {
       isOpened = !isOpened;
    });
     
  }

  Widget toggle() {
    return FloatingActionButton(
      backgroundColor: _animateColor.value,
      onPressed: animate,
      tooltip: 'Toggle',
      child: (isOpened)? HighLightedIcon(Icons.wb_sunny,color: Theme.of(context).accentColor,):
      HighLightedIcon(Icons.brightness_3,color: Theme.of(context).accentColor,),
      // child: AnimatedIcon(
      //   icon: AnimatedIcons.menu_home,
      //   color:Colors.red,
      //   progress: _animateIcon,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
  
    return toggle();
  }
}